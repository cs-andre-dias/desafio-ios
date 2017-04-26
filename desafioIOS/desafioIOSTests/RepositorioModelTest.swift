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
        XCTAssertGreaterThanOrEqual((mapper?.items.count)!, 0)
    }
    
    func testRepositorio(){
        let name = "awesome-ios"
        let descriptionRepo = "repositorio com muitos links"
        let stars = 1500
        let forks = 30
        let owner = [String : Any]()
        let json = "{\"name\" : \"\(name)\", \"forks\" : \"\(forks)\", \"stargazers_count\" : \"\(stars)\", \"description\" : \"\(descriptionRepo)\", \"\(owner)\" : {}}"
        
        let mapper = Mapper<Repositorio>().map(JSONString: json)
        
        XCTAssertNotNil(mapper)
        XCTAssertEqual(name, mapper?.name)
        XCTAssertEqual(descriptionRepo, mapper?.descriptionRepo)
        if let fork = mapper?.forks{
           XCTAssertEqual(forks, fork)
        }
        if let star = mapper?.stars{
            XCTAssertEqual(stars, star)
        }
        
    }
    
    func testRepositorioOwner(){
        let login = "Alamofire"
        let foto = "https://avatars.githubusercontent.com/u/7774181?v=3"
        let json = "{\"login\" : \"\(login)\", \"avatar_url\" : \"\(foto)\"}"
        
        let mapper = Mapper<RepositoryOwner>().map(JSONString: json)
        
        XCTAssertNotNil(mapper)
        XCTAssertNotNil(mapper?.foto)
        XCTAssertNotNil(mapper?.login)
        XCTAssertEqual(login, mapper?.login)
        
    }

}

