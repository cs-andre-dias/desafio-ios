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
    
    var repositorio = Repositorio(name: "", descriptionRepo: "", title: "", body: "", login: "", stars: "", forks: "", foto: nil)
    
    var names = [[String : Any]]()
    
    let urlString: String = "https://api.github.com/search/repositories?q=language:swift"
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    
    @IBOutlet var viewActivity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityInd.startAnimating()
        activityInd.hidesWhenStopped = true
        activityInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityInd.center = view.center
        
        if let url = URL(string: urlString){
             if let data = try? Data(contentsOf: url){
                let json = JSON(data: data)
                let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) ->
                    Void in
                    if error != nil {
                        print(error!)
                        self.activityInd.stopAnimating()
                        self.viewActivity.isHidden = true
                        return
                    }else{
                        self.parse(json: json)
                        self.activityInd.stopAnimating()
                        self.viewActivity.isHidden = true
                    }
                })
                task.resume()
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
            repositorio.stars = String(items["stargazers_count"].intValue)
            repositorio.forks = String(items["forks"].intValue)
            var aux = items["owner"].dictionary
            repositorio.login = (aux?["login"]?.stringValue)!
            let stringImage = aux?["avatar_url"]?.stringValue
            let link = URL(string: stringImage!)
            let data = try? Data(contentsOf: link!)
            let foto = UIImage(data: data!)
            let obj = ["name": repositorio.name, "description" : repositorio.descriptionRepo, "login" : repositorio.login, "stars" : repositorio.stars, "forks" : repositorio.forks, "foto" : foto!] as [String : Any]
            names.append(obj)
        }

        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RepoCell
        let name = names[indexPath.row]
        cell.nameRepo.text = name["name"] as! String?
        cell.descriptionRepo.text = name["description"] as! String?
        cell.stars.text = name["stars"] as! String?
        cell.forks.text = name["forks"] as! String?
        cell.userName.text = name["login"] as? String
        cell.foto.image = name["foto"] as? UIImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RepoSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RepoSegue" {
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            if let row = tableView.indexPathForSelectedRow?.row {
                let items = names[row]
                if let detailRepoViewController = segue.destination as? DetailRepoTableViewController{
                    detailRepoViewController.repoName = (items["name"] as? String)!
                    detailRepoViewController.login = (items["login"] as? String)!
                    
                }
            }
        }
    }
            
}
    
   
