//
//  Constants.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit

public struct Constants {
    public struct Home {
        public struct Identifiers {
            public static let homeCell = "homeCell"
        }
        
        public struct Labels {
            public static let navigationBarTitle = "Pokemon"
            public static let searchBatPlaceHolder = "Search"
        }
        
        public struct TableView {
            public static let cellHeight : CGFloat = 75
            public static let imagePlaceholder = "placeholder"
        }
        
        public struct Colors {
            public static let background = UIColor(named: "homeBackground")
        }
    }
    
    public struct MainTabBar {
        public struct Colors {
            public static let tabBarSelectedColor = UIColor(named: "tabBarSelected")
            public static let tabBarUnselectedItemColor = UIColor(named: "tabBarUnselectedItemColor")
            public static let tabBarBackgroundColor = UIColor(named: "tabBarBackgroundColor")
        }
    }
    
    public struct API {
        public static let baseAPI = "https://pokeapi.co/api/v2"
        public struct Pokemons {
            public static let pokemonsAPI = Constants.API.baseAPI + "/pokemon"
        }
        
        public static let imagesAPI = "https://pokeres.bastionbot.org/images/pokemon/%d.png"
    }
}
