//
//  Profile.swift
//  Buddy School Search
//
//  Created by AppStarter on 10.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import ObjectMapper

public struct Profile: Mappable {
    
    var profilePrice: String?
    var teacherLogin: String?
    var teacherPhoto: String?
    var profileTitle: String?
    var profileUrl: String?
    
    private init() {
    }
    
    public init?(map: Map) {
        self.init()
    }
    
    mutating public func mapping(map: Map) {
        profilePrice    <- map["profile_price"]
        teacherLogin    <- map["teacher_login"]
        teacherPhoto    <- map["teacher_photo"]
        profileTitle    <- map["profile_title"]
        profileUrl      <- map["profile_url"]
    }
}
