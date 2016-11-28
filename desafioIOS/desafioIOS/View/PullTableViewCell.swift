//
//  PullTableViewCell.swift
//  desafioIOS
//
//  Created by Andre Dias on 17/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit

class PullTableViewCell: UITableViewCell {
    
    @IBOutlet var tituloPull: UILabel!
    @IBOutlet var descricaoPull: UILabel!
    @IBOutlet var imagemUsuario: UIImageView!
    @IBOutlet var nomeUsuario: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
