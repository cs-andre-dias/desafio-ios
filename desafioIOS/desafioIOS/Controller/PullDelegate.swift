//
//  PullDelegate.swift
//  desafioIOS
//
//  Created by Andre Dias on 28/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit


class PullDelegate: NSObject, UITableViewDelegate{
    
    weak var pullTableViewController: PullTableViewController?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pullTableViewController?.performSegue(withIdentifier: "PullSegue", sender: nil)
    }

}
