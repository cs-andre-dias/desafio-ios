//
//  Repositorio.swift
//  desafioIOS
//
//  Created by Andre Dias on 07/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class Repositorio: NSObject{
    
    var name: String
    var descriptionRepo: String
    var title: String
    var body: String
    var login: String
    var stars: String
    var forks: String
    var foto: UIImage?
    
    
    init(name: String, descriptionRepo: String, title: String, body: String, login: String, stars: String, forks: String, foto: UIImage?){
        self.name = name
        self.descriptionRepo = descriptionRepo
        self.title = title
        self.body = body
        self.login = login
        self.stars = stars
        self.forks = forks
        self.foto = foto
        
        super.init()
    }
    
    
}
