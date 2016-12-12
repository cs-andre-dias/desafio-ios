//
//  RepositoryOwner.swift
//  desafioIOS
//
//  Created by Andre Dias on 08/12/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoryOwner: Mappable {
    
    var login: String?
    var foto: URL?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        login <- map["login"]
        foto <- (map["avatar_url"], URLTransform())
    }
    
}
