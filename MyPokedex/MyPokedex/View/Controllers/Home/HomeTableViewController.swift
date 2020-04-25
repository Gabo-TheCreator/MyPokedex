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
        
        let thisPokemon = homeViewModel.allPokemonsDetails[indexPath.row]
        
        homeCell.name.text = thisPokemon.name.capitalized
        
        let id = thisPokemon.id
        homeCell.id.text = "#" + String(id)
        let url = URL(string: String(format: Constants.API.imagesAPI, id))
        
        homeCell.pokemonImageView.sd_setImage(with: url, placeholderImage: UIImage(named: Constants.Home.TableView.imagePlaceholder), options: [.continueInBackground], completed: nil)
        
        if let primaryTypeName = homeViewModel.retrivePrimaryType(thisPokemon)?.type.name.capitalized {
            if let primaryTypeImage = UIImage(named: Constants.Home.ImagesTypes.type + primaryTypeName) {
                homeCell.mainTypeImageView.image = primaryTypeImage
            }
        }
        
        if let secondaryTypeName = homeViewModel.retriveSecondaryType(thisPokemon)?.type.name.capitalized {
            if let secondaryTypeImage = UIImage(named: Constants.Home.ImagesTypes.type + secondaryTypeName) {
                homeCell.secondaryTypeImageView.image = secondaryTypeImage
            }
        } else {
            homeCell.secondaryTypeView.isHidden = true
            homeCell.typesStackWidthConstraint.constant = 40
        }
                
        return homeCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Home.TableView.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row #\(indexPath.row)")
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: Constants.Home.Segues.toPokemonDetail, sender: nil)
        }
    }
}
