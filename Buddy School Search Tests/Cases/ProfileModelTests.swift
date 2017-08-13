//
//  ProfileModelTests.swift
//  Buddy School Search
//
//  Created by AppStarter on 12.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import XCTest
import ObjectMapper

@testable import Buddy_School_Search

class ProfileModelTests: XCTestCase {
    
    var dictionary: [[String: AnyObject]]?
    var profiles: [Profile]?
    
    override func setUp() {
        super.setUp()
        
        guard let filePath = Bundle(for: ProfileModelTests.self).url(forResource: "profiles", withExtension: "json") else { return }
        guard let data = try? Data(contentsOf: filePath) else { return }
        guard let jsonData = try? JSONSerialization.jsonObject(with: data as Data, options: []) else { return }
        dictionary = jsonData as? [[String: AnyObject]]
        
        guard let dictionary = dictionary else { return }
        profiles = dictionary.flatMap { Mapper<Profile>().map(JSON: $0) }
    }

    func testJSONDataHasCorrectlyPath() {
        XCTAssertNotNil(dictionary, "JSON Data have incorrect path")
    }
    
    func testProfilesHasExpectedItemsCount() {
        XCTAssert(profiles?.count == 3, "Profiles didn't have expected number of items")
    }
    
    func testProfilesHasExpectedValues() {
        XCTAssertEqual(profiles?[0].teacherLogin, "erni.kasia")
        XCTAssertEqual(profiles?[0].profileTitle, "Polish lessons via Skype")
        XCTAssertEqual(profiles?[0].profilePrice, "26.67 USD")
    }
}
