//
//  Repositorio.swift
//  desafioIOS
//
//  Created by Andre Dias on 07/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import Foundation
import ObjectMapper

class Repositorio: Mappable{
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point

    var name: String?
    var descriptionRepo: String?
    var login: String?
    var stars: Int?
    var forks: Int?
    var foto: UIImage?
    var owner: RepositoryOwner!
    
    required init?(map: Map){
        
    }
    
    init(name: String?, description: String?, stars: Int, forks: Int, login: String, foto: UIImage) {
        self.name = name
        self.descriptionRepo = description
        self.stars = stars
        self.forks = forks
        self.login = login
        self.foto = foto
    }


    func mapping(map: Map) {
        name <- map["name"]
        descriptionRepo <- map["description"]
        stars <- map["stargazers_count"]
        forks <- map["forks"]
        owner <- map["owner"]
    }
   
}
