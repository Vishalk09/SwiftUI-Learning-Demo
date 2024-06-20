//
//  NewsDetailView.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 01/09/23.
//

import SwiftUI
import WebKit

struct NewsDetailView: View {
    @State var newsModel: Article.Response
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: newsModel.urlToImage ?? "")) { image in
                image.image?.resizable()
            }
            .frame(width: 300, height: 300,alignment: .top)
            Text(newsModel.title ?? "").font(.system(size: 16, weight: .semibold, design: .default)).padding(.bottom, 15)
            Text(newsModel.content ?? "").font(.system(size: 14, weight: .medium, design: .default)).fixedSize(horizontal: false, vertical: false)
            Spacer()
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(newsModel: Article.Response())
    }
}
 
struct WebView: UIViewRepresentable {
    
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
