//
//  APIEnums.swift
//  Buddy School Search
//
//  Created by AppStarter on 10.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import Foundation

enum APIResult<T, ErrorString> {
    case Success(T)
    case Error(ErrorString)
}

protocol ErrorString {
    var errorDescription: String {get}
}
