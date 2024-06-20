//
//  NewsWorker.swift
//  SwiftUI-Navigation
//
//  Created by Vishal Khokad on 31/08/23.
//

import Foundation
import Alamofire

func getAPIResponse() {
//    AF.request("https://newsapi.org/v2/top-headlines?country=in&apiKey=25268e535d744afaa8acb1b5a0eeb09e").responseJSON { response in
//        do {
//            let result = try JSONDecoder().decode(Response, from: response)
//        }
//        print(response.data!)
//        print(response.response!.statusCode)
//        print(response.result)
//    }
    
//    let headers: HTTPHeaders = [.contentType("application/json")]
//    let param = Request(country: "in", apiKey: "25268e535d744afaa8acb1b5a0eeb09e")
//    AF.request("https://newsapi.org/v2/top-headlines",method: .get, parameters: param, encoder: JSONParameterEncoder.json,headers: headers).response (completionHandler: { responseData in
//        print(responseData.data)
//
//    })
    
    AF.request("https://newsapi.org/v2/top-headlines?country=in&apiKey=25268e535d744afaa8acb1b5a0eeb09e").responseJSON {response in
        
        print(response.result)
        switch response.result {
        case .success:
            if let jsonData = response.data {
                do {
                    let result = try JSONDecoder().decode(NewsFeedModel.self, from: jsonData)
                    print(result)
                    
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
