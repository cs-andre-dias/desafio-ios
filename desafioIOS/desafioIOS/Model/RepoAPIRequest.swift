//
//  RepoAPIRequest.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit
import SwiftyJSON

class RepoAPIRequest: NSObject {
    
    let urlString: String = "https://api.github.com/search/repositories?q=language:swift"
    
    func request(dataSource: RepositoryDataSources, tableView: UITableView){
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                let json = JSON(data: data)
                for items in json["items"].arrayValue{
                    let name = items["name"].stringValue
                    let description = items["description"].stringValue
                    let stars = String(items["stargazers_count"].intValue)
                    let forks = String(items["forks"].intValue)
                    var aux = items["owner"].dictionary
                    let login = (aux?["login"]?.stringValue)!
                    let stringImage = aux?["avatar_url"]?.stringValue
                    let link = URL(string: stringImage!)
                    let data = try? Data(contentsOf: link!)
                    let foto = UIImage(data: data!)
                    let repositorio = Repositorio(name: name, descriptionRepo: description, login: login, stars: stars, forks: forks, foto: foto)
                    
                    dataSource.resultRequest.append(repositorio)
                }
            }
        }
        tableView.reloadData()
        
    }
    
}

