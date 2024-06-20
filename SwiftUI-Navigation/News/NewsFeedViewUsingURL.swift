//
//  NewsFeedViewUsingURL.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 25/09/23.
//

import SwiftUI

struct NewsFeedViewUsingURL: View {
    @State private var newsData: [Article.Response]?
    var body: some View {
        NavigationView {
            List() {
//                guard let articles = newsData else {
//                    print("No articles")
//                }
                ForEach(newsData ?? [Article.Response()], id: \.publishedAt) { response in
                    NavigationLink(destination: {
//                      NewsDetailView(newsModel: response)
                        if let string = response.url, let url = URL(string: string) {
                            WebView(url: url)
                        }
                        
                        
                        
                    }, label: {
                        HStack(spacing: 10) {
                            if let url = response.urlToImage, let title = response.title {
                                AsyncImage(url: URL(string: url)){ image in
                                        image
                                        .image?.resizable()
                                }
                                    .frame(width: 50, height: 50, alignment: .leading)
                                Text(title)
                                    .font(.system(size: 15,weight: .medium,design: .default))
                            }
                        }
                    })
                }
            }
        }
        .navigationBarTitle(Text("ICS News"))
        .navigationBarTitleDisplayMode(.inline)
        .task {
            do {
                let news = try await getNewsResponse()
                newsData = news.articles
//                print(newsData ?? "invalid")
            } catch NError.invalidURL {
                print("Invalid URL")
            } catch NError.invalidResponse {
                print("Invalid Response")
            } catch NError.invalidData {
                print("Invalid Data")
            } catch {
                print("Unexpected error ")
            }
        }
    }
    
    
    func getNewsResponse() async throws -> NewsFeedModel {
        let endpoint = "https://newsapi.org/v2/top-headlines?country=in&apiKey=25268e535d744afaa8acb1b5a0eeb09e"
        
        guard let url = URL(string: endpoint) else {
            throw NError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(NewsFeedModel.self, from: data)
        } catch {
            throw NError.invalidData
        }
    }
}

struct NewsFeedViewUsingURL_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedViewUsingURL()
    }
}
