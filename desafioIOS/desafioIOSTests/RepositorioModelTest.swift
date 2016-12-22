//
//  RepositorioTest.swift
//  desafioIOS
//
//  Created by Andre Dias on 21/12/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import XCTest
import Foundation
import ObjectMapper

@testable import desafioIOS

class RepositorioTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRepoItemsList(){
        let name = "Alamofire"
        let forks = 1000
        let json = "{\"items\":[{\"name\" : \"\(name)\", \"forks\" : \"\(forks)\"}]}"
        
        let mapper = Mapper<RepositoryList>().map(JSONString: json)
        
        XCTAssertNotNil(mapper)
        XCTAssert((mapper?.items.count)! > 0)

    }
    
    
}

