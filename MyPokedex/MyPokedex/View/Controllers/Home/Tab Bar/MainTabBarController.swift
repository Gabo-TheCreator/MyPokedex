//
//  MainTabBarController.swift
//  MyPokedex
//
//  Created by G4B0 CU4DR05_C4RD3N4S on 2020/04/25.
//  Copyright © 2020 Gabo-TheCreator. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = Constants.MainTabBar.Colors.tabBarSelectedColor
        self.tabBar.unselectedItemTintColor = Constants.MainTabBar.Colors.tabBarUnselectedItemColor
        self.tabBar.backgroundColor = Constants.MainTabBar.Colors.tabBarBackgroundColor
    }
}
