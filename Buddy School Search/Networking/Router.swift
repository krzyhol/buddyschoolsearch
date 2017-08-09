//
//  Router.swift
//  Buddy School Search
//
//  Created by AppStarter on 09.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "https://buddyschool.com"
    
    case Search(keyword: String)
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/partial/get-search-results"
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Router.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case let .Search(keyword):
            return try Alamofire.URLEncoding.default.encode(urlRequest, with: ["keyword": keyword])
        }
    }
}
