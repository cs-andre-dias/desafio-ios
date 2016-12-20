//
//  PullDataSources.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit
import Kingfisher

class PullDataSources: NSObject, UITableViewDataSource{
    
    var resultRequest = [PullRequests]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("PullTableViewCell", owner: self, options: nil)?.first as! PullTableViewCell
        let content = resultRequest[indexPath.row]
        cell.nomeUsuario.text = content.user?.login
        cell.descricaoPull.text = content.descricaoPull
        cell.tituloPull.text = content.tituloPull
        let queue = DispatchQueue(label: "pull")
        queue.async {
            if let foto = content.user?.foto {
                DispatchQueue.main.async {
                    cell.imagemUsuario.kf.setImage(with: foto)
                }
            }
        }
            return cell
    }
    
}
