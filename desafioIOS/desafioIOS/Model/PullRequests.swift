//
//  PullRequests.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class PullRequests: NSObject {
    
    var tituloPull: String
    var descricaoPull: String
    var urlPull: URL?
    var nomeUsuario: String
    var imagemUsuario: UIImage?
    
    
    init(tituloPull: String, descricaoPull: String, urlPull: URL?, nomeUsuario: String, imagemUsuario: UIImage? ){
        self.tituloPull = tituloPull
        self.descricaoPull = descricaoPull
        self.urlPull = urlPull
        self.nomeUsuario = nomeUsuario
        self.imagemUsuario = imagemUsuario
        
        super.init()
    }
}
