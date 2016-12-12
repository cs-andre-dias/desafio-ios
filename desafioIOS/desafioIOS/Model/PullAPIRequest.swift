//
//  PullAPIRequest.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class PullApiRequest: NSObject {
    
    func request(dataSource: PullDataSources, tableView: UITableView, login: String, repoName: String){
        
        let urlPull = "https://api.github.com/repos/\(login)/\(repoName)/pulls"
        
        Alamofire.request(urlPull).validate().responseJSON { (response) in
            
            guard let pullmapper = Mapper<PullRequests>().mapArray(JSONArray: response.result.value as! [[String : Any]]) else{ return }
    
            dataSource.resultRequest.append(contentsOf: pullmapper)

            
            tableView.reloadData()

        }
        
    }

}
