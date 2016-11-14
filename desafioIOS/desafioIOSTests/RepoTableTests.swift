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
    
    let urlString: String = "https://api.github.com/search/repositories?q=language:swift"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
    func testJsonString(){
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        XCTAssertNotNil(url)
        XCTAssert(type(of: url) == URL?.self, "Método URL Nao funciona")
        
        XCTAssertNotNil(data, "Nao conseguiu extrair dados da url")
    }
}
