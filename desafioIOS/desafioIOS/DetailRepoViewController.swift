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
    
    var request = PullApiRequest()
    
    var dataSource = PullDataSources()
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    
    @IBOutlet var viewActivity: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.request(dataSource: dataSource, tableView: tableView, login: login, repoName: repoName)
        
        self.tableView.dataSource = dataSource
        
        
        
        activityInd.startAnimating()
        activityInd.hidesWhenStopped = true
        activityInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityInd.center = view.center
        activityInd.stopAnimating()
        

   }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PullSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PullSegue" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let items = dataSource.resultRequest[row]
                if let webPullViewController = segue.destination as? WebPullViewController{
                    webPullViewController.url = items.urlPull as NSURL!                }
            }
        }
    }

}
