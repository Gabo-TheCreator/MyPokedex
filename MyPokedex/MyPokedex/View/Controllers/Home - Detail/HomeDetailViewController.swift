//
//  HomeDetailViewController.swift
//  MyPokedex
//
//  Created by Gabo Cuadros Cardenas on 4/25/20.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit
import SDWebImage
import UIImageColors

class HomeDetailViewController: UIViewController {

    // MARK: - IBOutlets
        // - UITableView
            // - Table Header
    @IBOutlet weak var tableViewHeader: UIView!
    @IBOutlet weak var headerColorView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var viewSeparator: UIView!
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var stackType: UIStackView!
    
    @IBOutlet weak var mainTypeView: UIView!
    @IBOutlet weak var mainTypeImage: UIImageView!
    
    @IBOutlet weak var secondaryTypeView: UIView!
    @IBOutlet weak var secondaryTypeImage: UIImageView!
    
    // MARK: - Variables
    var homeViewModel: HomeViewModel?
    
    // MARK: - System Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI {
            self.setUpData()
        }
    }
    
    // MARK: - Functions
    
    func setUpUI(completion:@escaping() -> ()) {
        guard let homeViewModelUnwrapped = homeViewModel, let selectedPokemon = homeViewModelUnwrapped.selectedPokemon else {
            return
        }
        
        func setBackgroundColor () {
            let primaryType = homeViewModelUnwrapped.retrivePrimaryType(selectedPokemon)?.type.name.capitalized ?? ""
            let primaryImageName = Constants.Home.ImagesTypes.type + primaryType
            let primaryImage = UIImage(named: primaryImageName)
            let colors = primaryImage?.getColors()
            var mainColor = colors?.background
            if mainColor == UIColor(red: 1, green: 1, blue: 1, alpha: 1) {
                mainColor = colors?.primary
            }
            headerColorView.backgroundColor = mainColor
        }
        
        setBackgroundColor()
        
        viewSeparator.roundSelectedCorners(clipToBounds: true, cornerRadius: 35, [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        
        headerImageView.sd_setImage(with: homeViewModelUnwrapped.getImageURLStringFor(pokemonDetails: selectedPokemon), completed: nil)
        
        if let primaryTypeName = homeViewModelUnwrapped.retrivePrimaryType(selectedPokemon)?.type.name.capitalized {
            if let primaryTypeImage = UIImage(named: Constants.Home.ImagesTypes.tags + primaryTypeName) {
                self.mainTypeImage.image = primaryTypeImage
            }
        }
        
        if let secondaryTypeName = homeViewModelUnwrapped.retriveSecondaryType(selectedPokemon)?.type.name.capitalized {
            if let secondaryTypeImage = UIImage(named: Constants.Home.ImagesTypes.tags + secondaryTypeName) {
                self.secondaryTypeImage.image = secondaryTypeImage
            }
        } else {
            self.secondaryTypeView.isHidden = true
        }
        
        self.pokemonName.text = selectedPokemon.name
        
        
        completion()
    }
    
    func setUpData () {
        
    }
    
    // MARK: - IBActions
    
    @IBAction func goBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
