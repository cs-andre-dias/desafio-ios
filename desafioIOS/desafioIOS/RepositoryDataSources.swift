//
//  RepositoryDataSources.swift
//  desafioIOS
//
//  Created by Andre Dias on 16/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class RepositoryDataSources: NSObject, UITableViewDataSource {
    
    var resultRequest = [Repositorio]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultRequest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("RepoTableViewCell", owner: self, options: nil)?.first as! RepoTableViewCell
        let content = resultRequest[indexPath.row]
        cell.nomeRepo.text = content.name
        cell.RepoDescricao.text = content.descriptionRepo
        cell.starsRepo.text = content.stars
        cell.forksRepo.text = content.forks
        cell.nomeUsuario.text = content.login
        cell.fotoRepo.image = content.foto
        return cell
    }
    
}
