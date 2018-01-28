//
//  ZMTabBarViewController.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/27/18.
//

import Foundation
import UIKit
import InteractiveSideMenu

/*
 TabBarViewController is a controller relevant one of the side menu items. To indicate this it adopts `SideMenuItemContent` protocol.
 */
class ZMTabBarViewController: UITabBarController, SideMenuItemContent {
    
}

/*
 The first controller of tab bar.
 */
class FirstViewController: UIViewController {
    
    /*
     Show menu on click if connected tab bar controller adopts proper protocol.
     */
    @IBAction func openMenu(_ sender: UIButton) {
        
        if let menuItemViewController = self.tabBarController as? SideMenuItemContent {
            menuItemViewController.showSideMenu()
        }
    }
}

/*
 The second controller of tab bar.
 */
class SecondViewController: UIViewController {
    
    /*
     Show menu on click if connected tab bar controller adopts proper protocol.
     */
    @IBAction func openMenu(_ sender: UIButton) {
        
        if let menuItemViewController = self.tabBarController as? SideMenuItemContent {
            menuItemViewController.showSideMenu()
        }
    }
    
}
