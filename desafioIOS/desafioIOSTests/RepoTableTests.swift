//
//  RepoTableTests.swift
//  desafioIOS
//
//  Created by Andre Dias on 11/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import XCTest
@testable import desafioIOS

class RepoTableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewControllerLoad(){
        let vc = RepoTableViewController()
        
        XCTAssertNotNil(vc.view, "View not load for RepoTableViewController")
    }
    
}
