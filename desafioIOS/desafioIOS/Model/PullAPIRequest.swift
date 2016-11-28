//
//  PullAPIRequest.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit
import SwiftyJSON

class PullApiRequest: NSObject {
    
    func request(dataSource: PullDataSources, tableView: UITableView, login: String, repoName: String){
       
        let urlPull = "https://api.github.com/repos/\(login)/\(repoName)/pulls"
        
        if let url = URL(string: urlPull){
            if let data = try? Data(contentsOf: url){
                let json = JSON(data: data)
                for titles in json.arrayValue{
                    let name = titles["title"].stringValue
                    let description = titles["body"].stringValue
                    var aux = titles["user"].dictionary
                    let nameUser = (aux?["login"]?.stringValue)!
                    let stringFoto = aux?["avatar_url"]?.stringValue
                    let link = URL(string: stringFoto!)
                    let data = try? Data(contentsOf: link!)
                    let fotoUser = UIImage(data: data!)
                    let htmlUrl = titles["html_url"].stringValue
                    let url = URL(string: htmlUrl)
                    let pullRequest = PullRequests(tituloPull: name, descricaoPull: description, urlPull: url, nomeUsuario: nameUser, imagemUsuario: fotoUser)

                    dataSource.resultRequest.append(pullRequest)
                }

            }
        }
        tableView.reloadData()
    }
    
}

