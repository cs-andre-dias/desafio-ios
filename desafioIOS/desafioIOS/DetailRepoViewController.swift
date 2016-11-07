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
    
    var pullRequests = [[String : Any]]()

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
            let htmlUrl = titles["html_url"].stringValue
            let url = URL(string: htmlUrl)
            let obj = ["title": name, "body" : description, "url" : url!] as [String : Any]
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
        cell.textLabel?.text = infoPull["title"] as! String?
        cell.detailTextLabel?.text = infoPull["body"] as! String?
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PullSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PullSegue" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let items = pullRequests[row]
                if let webPullViewController = segue.destination as? WebPullViewController{
                    webPullViewController.url = items["url"] as? NSURL
                }
            }
        }
    }

}
