//
//  SearchServiceIntegrationTests.swift
//  Buddy School Search
//
//  Created by AppStarter on 13.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import XCTest

@testable import Buddy_School_Search
    
class SearchServiceIntegrationTests: XCTestCase {
    
        func testLoadProfilesFormSearchService() {
            
            let expectation = self.expectation(description: "Expected load profiles from service fail")
            
            SearchService.getProfiles(forKeyword: "") { result in
                expectation.fulfill()
                
                switch result {
                case .Success(_):
                    XCTAssert(true)
                case .Error(_):
                    XCTAssert(false)
                }
            }
            
            waitForExpectations(timeout: 3.0, handler: nil)
        }
        
}
