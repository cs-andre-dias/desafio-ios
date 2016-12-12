//
//  PullRequests.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import Foundation
import ObjectMapper

class PullRequests: Mappable{
    
    var tituloPull: String?
    var descricaoPull: String?
    var urlPull: URL?
    var nomeUsuario: String?
    var user: PullListUser?
    var foto: URL?
    
    required init?(map: Map){
    }
    
    init(tituloPull: String, descricaoPull: String, urlPull: URL?, nomeUsuario: String ){
        self.tituloPull = tituloPull
        self.descricaoPull = descricaoPull
        self.urlPull = urlPull
        self.nomeUsuario = nomeUsuario
    }
    
    func mapping(map: Map) {
        tituloPull <- map["title"]
        descricaoPull <- map["body"]
        urlPull <- (map["html_url"], URLTransform())
        user <- map["user"]
    }
}
