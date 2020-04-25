//
//  HomeViewController.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet var homeViewModel: HomeViewModel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Variables
    lazy var homeCellIdentifier = Constants.Home.Identifiers.homeCell
    
    
    // MARK: - System Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setUpUI {
            setUpData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    // MARK: - Functions
    
    func setUpUI(completion: () -> ()) {
        // Set up text's
        self.navigationItem.title = Constants.Home.Labels.navigationBarTitle
        self.searchBar.placeholder = Constants.Home.Labels.searchBatPlaceHolder
        
        // Set up UITableView
        self.mainTableView.backgroundColor = Constants.Home.Colors.background
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        
        completion()
    }
    
    func setUpData () {
        homeViewModel.displayPokemons {
            DispatchQueue.main.async {
                self.mainTableView.reloadData()
            }
        }
    }
}
