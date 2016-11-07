//
//  DetailRepoViewController.swift
//  desafioIOS
//
//  Created by Andre Dias on 03/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit
import SwiftyJSON

class DetailRepoTableViewController: UITableViewController{
    
    var repoName = String()
    var login = String()
    
    var pullRequests = [[String : String]]()

    override func viewDidLoad() {
        let urlPull = "https://api.github.com/repos/\(login)/\(repoName)/pulls"
        if let url = URL(string: urlPull){
            if let data = try? Data(contentsOf: url){
                let json = JSON(data: data)
                parse(json: json)
                
            }
        }
    
        tableView.reloadData()
    }
    
    
    func parse(json: JSON){
        for titles in json.arrayValue{
            let name = titles["title"].stringValue
            let description = titles["body"].stringValue
            let obj = ["title": name, "body" : description]
            pullRequests.append(obj)
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pullCell", for: indexPath)
        let infoPull = pullRequests[indexPath.row]
        cell.textLabel?.text = infoPull["title"]
        cell.detailTextLabel?.text = infoPull["body"]
        return cell
    }

}
