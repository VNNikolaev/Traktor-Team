//
//  PlayerViewController.swift
//  Traktor Team
//
//  Created by Васлий Николаев on 22.01.2020.
//  Copyright © 2020 Васлий Николаев. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    var currentPlayer: Player?
    
    @IBOutlet weak var playerPhoto: UIImageView!
    @IBOutlet weak var playerFullName: UILabel!
    @IBOutlet weak var playerAboutLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCurrentPlayer()
    }
    
    private func setupCurrentPlayer() {
        guard let player = currentPlayer else { return }
        
        DispatchQueue.global().async {
            guard let url = player.image else { return }
            guard let imageUrl = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.playerPhoto.image = UIImage(data: imageData)
                
            }
        }
        
        playerFullName.text = "\(player.name) \(player.surname)"
        playerAboutLabel.text = "Игровой номер \(player.number), хват \(player.hand), возраст \(player.age), рост \(player.height) см, вес \(player.weight)кг"
        
        
        
    }
    
}
