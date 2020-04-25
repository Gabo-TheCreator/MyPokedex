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
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Variables
    lazy var homeCellIdentifier = Constants.Home.Identifiers.homeCell
    
    
    // MARK: - System Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    // MARK: - Functions
    
    func setUpUI() {
        // Set up text's
        self.navigationItem.title = Constants.Home.Labels.navigationBarTitle
        self.searchBar.placeholder = Constants.Home.Labels.searchBatPlaceHolder
        
        // Set up UITableView
        self.mainTableView.backgroundColor = Constants.Home.Colors.background
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
