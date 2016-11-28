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
    
    let dataSourceRepo = RepositoryDataSources()
    let repoDelegate = RepoDelegate()

    var request = RepoAPIRequest()
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    
    @IBOutlet var viewActivity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.request(dataSource: dataSourceRepo, tableView: tableView)
        
        self.tableView.dataSource = dataSourceRepo
        self.tableView.delegate = repoDelegate
        self.repoDelegate.repoTableViewController = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        activityInd.startAnimating()
        activityInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityInd.center = view.center
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        activityInd.hidesWhenStopped = true
        activityInd.stopAnimating()
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RepoSegue" {
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
            if let row = tableView.indexPathForSelectedRow?.row {
                let items = dataSourceRepo.resultRequest[row]
                if let pullViewController = segue.destination as? PullTableViewController{
                    pullViewController.repoName = items.name
                    pullViewController.login = items.login
                    
                }
            }
        }
    }
            
}
    
   
