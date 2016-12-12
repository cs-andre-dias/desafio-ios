//
//  RepoAPIRequest.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//
import Foundation
import Alamofire
import AlamofireObjectMapper


class RepoAPIRequest: NSObject {
    
    let urlString: String = "https://api.github.com/search/repositories?q=language:swift"

    func request(dataSource: RepositoryDataSources, tableView: UITableView){
        
        Alamofire.request(urlString).responseObject { (response: DataResponse<RepositoryList>) in
            let repo = response.result.value
            let item = repo?.items
            
            for values in item! {
                let name = values.name
                let description = values.descriptionRepo
                let star = values.stars
                let fork = values.forks
                let login = values.owner.login
                let data =  try? Data(contentsOf: values.owner.foto)
                let foto = UIImage(data: data!)
                
                
                let repositorio = Repositorio(name: name, description: description, stars: star!, forks: fork!, login: login!, foto: foto!)
                
                dataSource.resultRequest.append(repositorio)
            }
            tableView.reloadData()
        }
        
        
    }
    
}

