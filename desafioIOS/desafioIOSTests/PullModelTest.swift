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

class PullModelTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPullRequestsModel(){
        let title = "Alamofire"
        let body = "PR em tudo"
        let url = "https://github.com/Alamofire/Alamofire/pull/1866"
        let user = [PullListUser]()
        let json = "{\"title\" : \"\(title)\", \"body\" : \"\(body)\", \"html_url\" : \"\(url)\", \"\(user)\" : {}}"
        
        let mapper = Mapper<PullRequests>().map(JSONString: json)
        
        XCTAssertNotNil(mapper)
        XCTAssertNotNil
    }
    
    func testPullList(){
        let login = "awesome-ios"
        let foto = "https://avatars.githubusercontent.com/u/484656?v=3"
        let json = "{\"login\" : \"\(login)\", \"avatar_url\" : \"\(foto)\"}"
        
        let mapper = Mapper<PullListUser>().map(JSONString: json)
        
        XCTAssertNotNil(mapper)
        
    }
    

    
}

