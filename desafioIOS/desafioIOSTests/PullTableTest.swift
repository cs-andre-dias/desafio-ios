//
//  PullTableTest.swift
//  desafioIOS
//
//  Created by Andre Dias on 22/12/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import XCTest
@testable import desafioIOS

class PullTableTest: XCTestCase {
    
    var pullViewController: PullTableViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        pullViewController = storyBoard.instantiateInitialViewController() as! PullTableViewController
//        pullViewController = nav.topViewController as! PullTableViewController
        
//        UIApplication.shared.keyWindow!.rootViewController = pullViewController
        
        _ = pullViewController.view
        
        pullViewController.viewDidLoad()
      

        XCTAssertNotNil(pullViewController.view, "View not load for RepoTableViewController")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        pullViewController = nil
        super.tearDown()
    }
    
//    func testDataSourceRepo(){
//        XCTAssertNotNil(pullViewController.dataSource)
//    }

}
