//
//  RepoDelegate.swift
//  desafioIOS
//
//  Created by Andre Dias on 28/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit


class RepoDelegate: NSObject, UITableViewDelegate{
    
    weak var repoTableViewController: RepoTableViewController?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        repoTableViewController?.performSegue(withIdentifier: "RepoSegue", sender: nil)
    }

    
}
