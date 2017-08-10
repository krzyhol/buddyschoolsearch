//
//  Profile.swift
//  Buddy School Search
//
//  Created by AppStarter on 10.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import ObjectMapper

struct Profile: Mappable {
    
    var profilePrice: String?
    var teacherLogin: String?
    var teacherPhotoUrl: URL?
    var profileTitle: String?
    var profileUrl: URL?
    
    init?(map: Map) { }
    
    mutating public func mapping(map: Map) {
        profilePrice    <- map["profile_price"]
        teacherLogin    <- map["teacher_login"]
        teacherPhotoUrl <- (map["teacher_photo"], urlTransform)
        profileTitle    <- map["profile_title"]
        profileUrl      <- (map["profile_url"], urlTransform)
    }
    
    private let urlTransform = TransformOf<URL, String>(fromJSON: { (value: String?) -> URL? in
        guard let urlString = value else { return nil }
        return URL(string: Router.baseURLString + urlString)
    }, toJSON: { (value: URL?) -> String? in
        guard let url = value else { return nil }
        return try? String(contentsOf: url)
    })
}
