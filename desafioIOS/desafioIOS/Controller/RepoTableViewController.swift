//
//  RepoTableViewController.swift
//  desafioIOS
//
//  Created by Andre Dias on 28/10/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class RepoTableViewController: UITableViewController, UISearchBarDelegate {
    
    let dataSourceRepo = RepositoryDataSources()
    let repoDelegate = RepoDelegate()
    
    var searchBar = UISearchBar()

    var request = RepoAPIRequest()
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    @IBOutlet var viewActivity: UIView!
    
    let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: nil)
    
    @IBAction func changeButton(_ sender: Any) {
        if (self.navigationItem.titleView?.isHidden)! {
            navigationItem.titleView?.isHidden = false
        }else{
            navigationItem.titleView?.isHidden = true
            searchBar.resignFirstResponder()
            searchBar.showsCancelButton = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.request(dataSource: dataSourceRepo, tableView: tableView)
        
        self.tableView.dataSource = dataSourceRepo
        self.tableView.delegate = repoDelegate
        self.repoDelegate.repoTableViewController = self
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Filter results"
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
//        tableView.tableHeaderView = searchBar
        self.navigationItem.titleView?.isHidden = true
        
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSourceRepo.filteredArrayRepo = dataSourceRepo.resultRequest.filter({ (names: Repository) -> Bool in
            return names.name?.lowercased().range(of: searchText.lowercased()) != nil
        })
    
        if searchText == "" || searchText.characters.count < 1{
            dataSourceRepo.shouldShowInRepo = false
            self.navigationItem.rightBarButtonItem?.isEnabled = true
            searchBar.resignFirstResponder()
            tableView.reloadData()
        }else{
            dataSourceRepo.shouldShowInRepo = true
            searchBar.showsCancelButton = true
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            tableView.reloadData()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
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
            if dataSourceRepo.shouldShowInRepo {
                if let row = tableView.indexPathForSelectedRow?.row {
                    let items = dataSourceRepo.filteredArrayRepo[row]
                    if let pullViewController = segue.destination as? PullTableViewController{
                        pullViewController.repoName = items.name!
                        pullViewController.login = items.owner.login!
                    }
                }
            }else{
                if let row = tableView.indexPathForSelectedRow?.row {
                    let items = dataSourceRepo.resultRequest[row]
                    if let pullViewController = segue.destination as? PullTableViewController{
                        pullViewController.repoName = items.name!
                        pullViewController.login = items.owner.login!
                    }
                }
            }
        }
    }
            
}
    
   
