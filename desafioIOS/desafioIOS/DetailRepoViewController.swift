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
    
    var repoName = String() {
        didSet {
            navigationItem.title = repoName
        }
    }
    var login = String()
    
    var pullRequests = [[String : Any]]()
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    
    @IBOutlet var viewActivity: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityInd.startAnimating()
        activityInd.hidesWhenStopped = true
        activityInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityInd.center = view.center
        
        let urlPull = "https://api.github.com/repos/\(login)/\(repoName)/pulls"
        if let url = URL(string: urlPull){
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
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func parse(json: JSON){
        for titles in json.arrayValue{
            let name = titles["title"].stringValue
            let description = titles["body"].stringValue
            var aux = titles["user"].dictionary
            let nameUser = aux?["login"]?.stringValue
            let stringFoto = aux?["avatar_url"]?.stringValue
            let link = URL(string: stringFoto!)
            let data = try? Data(contentsOf: link!)
            let fotoUser = UIImage(data: data!)
            let htmlUrl = titles["html_url"].stringValue
            let url = URL(string: htmlUrl)
            let obj = ["title": name, "body" : description, "url" : url!, "nameUser" : nameUser!, "fotoUser" : fotoUser!] as [String : Any]
            
            
            pullRequests.append(obj)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pullCell", for: indexPath) as! PullCell
        let infoPull = pullRequests[indexPath.row]
        cell.tituloPull.text = infoPull["title"] as! String?
        cell.descricaoPull.text = infoPull["body"] as! String?
        cell.nameUser.text = infoPull["nameUser"] as! String?
        cell.fotoUser.image = infoPull["fotoUser"] as? UIImage
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
