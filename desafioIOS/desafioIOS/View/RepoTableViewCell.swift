//
//  RepoTableViewCell.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet var nomeRepo: UILabel!
    @IBOutlet var RepoDescricao: UILabel!
    @IBOutlet var forksRepo: UILabel!
    @IBOutlet var starsRepo: UILabel!
    @IBOutlet var nomeUsuario: UILabel!
    @IBOutlet var fotoRepo: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
