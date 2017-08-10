//
//  SearchService.swift
//  Buddy School Search
//
//  Created by AppStarter on 10.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import Alamofire
import ObjectMapper

class SearchService {
    class func getProfiles(forKeyword keyword: String, completion: @escaping (APIResult<[Profile], Error?>) -> ()) {
        Alamofire.request(Router.Search(keyword: keyword)).responseJSON { response in
            switch response.result {
            case .success(let JSON):
                guard let profilesJSON = JSON as? [[String: AnyObject]] else { return completion(.Error(nil)) }
                let profiles = profilesJSON.flatMap { Mapper<Profile>().map(JSON: $0) }

                return completion(.Success(profiles))
            case .failure(let error):
                return completion(.Error(error))
            }
        }
    }
}
