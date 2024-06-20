//
//  SwiftUIView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 31/08/23.
//

import SwiftUI
import Alamofire

struct NewsFeedView: View {
    @State var newsData: [Article.Response]
    @State private var shouldShowNews = false
    
    func getAPIResponse() {

        AF.request("https://newsapi.org/v2/top-headlines?country=in&apiKey=25268e535d744afaa8acb1b5a0eeb09e").responseJSON { response in
            
            //print(response.result)
            switch response.result {
            case .success:
                if let jsonData = response.data {
                    do {
                        let result = try JSONDecoder().decode(NewsFeedModel.self, from: jsonData)
                        print(result)
                        
                        for item in result.articles! {
                            print(item.title ?? "nil")
                        }
                        if let data = result.articles {
                            newsData = data
                        }
                        shouldShowNews = true

                        
                    }
                    catch let err {
                        print(err)
                    }
                }
                
    //            if let json = response.result as! [String:Any]?{
    //                if let responseValue = json["articles"] as! [[String:Any]]?{
    //                    print(responseValue)
    //                }
    //            }
            case .failure(let err):
                print(err.localizedDescription)
            }
            
            
        }
    }
    
    var body: some View {
        VStack{
            VStack(spacing: 0) {
                Rectangle().fill(.orange)
                ZStack{
                    Rectangle().fill(.white)
                    Circle().fill(.blue)
                }
                Rectangle().fill(.green)
            }.frame(height: 200)
            Button("Get news") {
                getAPIResponse()
            }
        }
        .sheet(isPresented: $shouldShowNews) {
            NewsTableView(news: $newsData)

        }

    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        
        NewsFeedView(newsData: [Article.Response()])
    }
}

struct NewsTableView: View {
    @Binding var news: [Article.Response]
    var body: some View {
        
        NavigationStack {
            List() {
                ForEach(news, id: \.publishedAt) { response in
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
    }
}
