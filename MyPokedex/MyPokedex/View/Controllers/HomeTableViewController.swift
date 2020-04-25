//
//  HomeTableViewController.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit
import SDWebImage

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: self.homeCellIdentifier, for: indexPath) as! HomeCell
        
        let thisRow = homeViewModel.allPokemonsDetails[indexPath.row]
        
        homeCell.name.text = thisRow.name.capitalized
        
        let id = thisRow.id
        homeCell.id.text = "#" + String(id)
        let url = URL(string: String(format: Constants.API.imagesAPI, id))
        
        homeCell.pokemonImageView.sd_setImage(with: url, placeholderImage: UIImage(named: Constants.Home.TableView.imagePlaceholder), options: [.continueInBackground], completed: nil)
                
        return homeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Home.TableView.cellHeight
    }
}
