//
//  DetailRepoViewController.swift
//  desafioIOS
//
//  Created by Andre Dias on 03/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class PullTableViewController: UITableViewController{
    
    var repoName = String() {
        didSet {
            navigationItem.title = repoName
        }
    }
    
    var login = String()
    
    var request = PullApiRequest()
    
    var dataSource = PullDataSources()
    
    var pullDelegate = PullDelegate()
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    
    @IBOutlet var viewActivity: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.request(dataSource: dataSource, tableView: tableView, login: login, repoName: repoName)
        
        self.tableView.dataSource = dataSource
        self.tableView.delegate = pullDelegate
        
        self.pullDelegate.pullTableViewController = self
        
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
        if segue.identifier == "PullSegue" {
            if let row = tableView.indexPathForSelectedRow?.row {
                let items = dataSource.resultRequest[row]
                if let webPullViewController = segue.destination as? WebPullViewController{
                    webPullViewController.url = items.urlPull as NSURL!                }
            }
        }
    }

}
