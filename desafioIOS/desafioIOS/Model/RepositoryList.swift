//
//  RepositoryList.swift
//  desafioIOS
//
//  Created by Andre Dias on 07/12/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import Foundation
import ObjectMapper

class RepositoryList: Mappable {
    
    var items: [Repositorio]!
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        items <- map["items"]
    }
    
}
