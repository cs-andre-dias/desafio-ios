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

    var request = RepoAPIRequest()
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    
    @IBOutlet var viewActivity: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.request(dataSource: dataSourceRepo, tableView: tableView)
        
        self.tableView.dataSource = dataSourceRepo
        
        
        
        activityInd.startAnimating()
    
        activityInd.hidesWhenStopped = true
        activityInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityInd.center = view.center
        activityInd.stopAnimating()
    }
    


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
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
                let items = dataSourceRepo.resultRequest[row]
                if let detailRepoViewController = segue.destination as? DetailRepoTableViewController{
                    detailRepoViewController.repoName = items.name
                    detailRepoViewController.login = items.login
                    
                }
            }
        }
    }
            
}
    
   
