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
    
    var vc: RepoTableViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nav = storyBoard.instantiateInitialViewController() as! UINavigationController
        vc = nav.topViewController as! RepoTableViewController
        
        UIApplication.shared.keyWindow!.rootViewController = vc
        
        _ = nav.view
        _ = vc.view
        
        vc.viewDidLoad()
        vc.viewWillAppear(true)
        vc.viewDidAppear(true)
        vc.viewWillDisappear(true)
        
        XCTAssertNotNil(nav.view, "Navigation Controller not load")
        XCTAssertNotNil(vc.view, "View not load for RepoTableViewController")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vc = nil
        super.tearDown()
    }
    
    func testProperties(){
        XCTAssertNotNil(vc.dataSourceRepo, "Data Source is nil")
        XCTAssertNotNil(vc.tableView.dataSource)
        XCTAssertNotNil(vc.repoDelegate)
        XCTAssertNotNil(vc.searchBar)
        XCTAssert(vc.searchBar.showsCancelButton == false)
        XCTAssert(vc.navigationItem.titleView?.isHidden == true)
    }
    
    
    
}
