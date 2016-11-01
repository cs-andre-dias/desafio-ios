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

    
    var names = [String]()
    
    let urlString: String = "https://api.github.com/search/repositories?q=language:swift"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString){
             if let data = try? Data(contentsOf: url){
                let json = JSON(data: data)
                parse(json: json)
            }
        }
        
    }
    
    func parse(json: JSON){
        for items in json["items"].arrayValue{
            let name = items["name"].stringValue
            names.append(name)
        }
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = names[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }
}
