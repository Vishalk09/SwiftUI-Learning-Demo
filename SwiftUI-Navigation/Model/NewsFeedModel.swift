//
//  NewsFeedModel.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 31/08/23.
//

import Foundation

struct NewsFeedModel: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [Article.Response]?
}

struct ErrorResponseModel: Decodable {
    var status: String
    var code: String
    var message: String
}

enum Article {
    struct Response: Decodable {
        
        var author: String?
        var content: String?
        var description: String?
        var publishedAt: String?
        var title: String?
        var url: String?
        var urlToImage: String?
    }
}

struct Source: Decodable {
    var id: String?
    var name: String?
}

enum NError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
