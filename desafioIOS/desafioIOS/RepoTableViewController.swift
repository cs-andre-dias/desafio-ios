//
//  RepoTableViewController.swift
//  desafioIOS
//
//  Created by Andre Dias on 28/10/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit
import SwiftyJSON

class RepoTableViewController: UITableViewController {
    
    var repositorio = Repositorio(name: "", descriptionRepo: "", title: "", body: "", login: "")
    
    var names = [[String : String]]()
    
    
    let urlString: String = "https://api.github.com/search/repositories?q=language:swift"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString){
             if let data = try? Data(contentsOf: url){
                let json = JSON(data: data)
                parse(json: json)
            }
        }
        func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
        }
        
        func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
        }
        self.tableView.reloadData()
        
    }
    
    func parse(json: JSON){
        for items in json["items"].arrayValue{
            repositorio.name = items["name"].stringValue
            repositorio.descriptionRepo = items["description"].stringValue
            var aux = items["owner"].dictionary
            repositorio.login = (aux?["login"]?.stringValue)!
            let obj = ["name": repositorio.name, "description" : repositorio.descriptionRepo, "login" : repositorio.login]
            names.append(obj)
        }

        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = names[indexPath.row]
        cell.textLabel?.text = name["name"]
        cell.detailTextLabel?.text = name["description"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RepoSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RepoSegue" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let items = names[row]
                let detailRepoViewController = segue.destination as! DetailRepoTableViewController
                    detailRepoViewController.repoName = items["name"]!
                    detailRepoViewController.login = items["login"]!
                }
            }
        }
            
    }
    
   
