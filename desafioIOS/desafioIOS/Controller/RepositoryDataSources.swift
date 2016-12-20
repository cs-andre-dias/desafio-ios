//
//  RepositoryDataSources.swift
//  desafioIOS
//
//  Created by Andre Dias on 16/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryDataSources: NSObject, UITableViewDataSource {
    
    var resultRequest = [Repositorio]()
    var shouldShowInRepo = false
    var filteredArrayRepo = [Repositorio]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let showRepo = shouldShowInRepo ? filteredArrayRepo :  resultRequest
        return showRepo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if shouldShowInRepo {
            let cell = Bundle.main.loadNibNamed("RepoTableViewCell", owner: self, options: nil)?.first as! RepoTableViewCell
            let content = filteredArrayRepo[indexPath.row]
            cell.nomeRepo.text = content.name
            cell.RepoDescricao.text = content.descriptionRepo
            cell.starsRepo.text = String(describing: content.stars!)
            cell.forksRepo.text = String(describing: content.stars!)
            cell.nomeUsuario.text = content.owner.login
            let queue = DispatchQueue(label: "repo")
            queue.async {
                if let foto = content.owner.foto {
                        DispatchQueue.main.async {
                        cell.fotoRepo.kf.setImage(with: foto)
                    }
                }
            }
            return cell
        }else{
            let cell = Bundle.main.loadNibNamed("RepoTableViewCell", owner: self, options: nil)?.first as! RepoTableViewCell
            let content = resultRequest[indexPath.row]
            cell.nomeRepo.text = content.name
            cell.RepoDescricao.text = content.descriptionRepo
            cell.starsRepo.text = String(describing: content.stars!)
            cell.forksRepo.text = String(describing: content.stars!)
            cell.nomeUsuario.text = content.owner.login
            let queue = DispatchQueue(label: "repo")
            queue.async {
                if let foto = content.owner.foto {
                    DispatchQueue.main.async {
                        cell.fotoRepo.kf.setImage(with: foto)
                    }
                }
            }
            return cell
        }
    }
}
