//
//  PlayerCell.swift
//  Traktor Team
//
//  Created by Васлий Николаев on 15.01.2020.
//  Copyright © 2020 Васлий Николаев. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var playerSurenameLabel: UILabel!
    @IBOutlet weak var playerPhotoImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerNamber: UILabel!
    
    func configure(with player: Player) {
        
        playerPhotoImageView.layer.cornerRadius = 45
        imageView?.clipsToBounds = true
        
        playerNameLabel.text = "\(player.name)"
        playerSurenameLabel.text = "\(player.surname)"
        playerNamber.text = "№\(player.number)"
        
        DispatchQueue.global().async {
            guard let url = player.image else { return }
            guard let imageUrl = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.playerPhotoImageView.image = UIImage(data: imageData)
            }
            
        }
    }

}
