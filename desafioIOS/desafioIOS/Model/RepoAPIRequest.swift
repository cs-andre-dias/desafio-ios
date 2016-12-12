//
//  RepoAPIRequest.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//
import Foundation
import Alamofire
import ObjectMapper


class RepoAPIRequest: NSObject {
    
    let urlString: String = "https://api.github.com/search/repositories?q=language:swift"

    func request(dataSource: RepositoryDataSources, tableView: UITableView){
        
        
        Alamofire.request(urlString).validate().responseJSON { (response) in
            
            guard let repoMapper = Mapper<RepositoryList>().map(JSON: response.result.value as! [String : Any]) else { return }
            
            dataSource.resultRequest.append(contentsOf: repoMapper.items)
            
            
            tableView.reloadData()
            
        }
        
    }
    
}

