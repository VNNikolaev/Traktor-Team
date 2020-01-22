//
//  TeamViewController.swift
//  Traktor Team
//
//  Created by Васлий Николаев on 15.01.2020.
//  Copyright © 2020 Васлий Николаев. All rights reserved.
//

import UIKit

class TeamViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    let jsonUrl = "https://api.myjson.com/bins/c9tae"
    var players: [Player] = []
    
    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.players = try JSONDecoder().decode([Player].self, from: data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(self.players)
            } catch let error {
                print(error)
            }
        }.resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCell
        
        let player = players[indexPath.row]
        cell.configure(with: player)

        return cell
    }
    

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let player = players[indexPath.row]
            let playerVC = segue.destination as! PlayerViewController
            playerVC.currentPlayer = player
            
        }
       
    }


}
