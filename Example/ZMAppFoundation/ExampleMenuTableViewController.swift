//
//  ExampleMenuTableViewController.swift
//  ZMAppFoundation_Example
//
//  Created by Jacob Foster Davis on 13Jul18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ZMAppFoundation

//This class defines how menu items are loaded to allow an app to customize menu options
class ExampleMenuTableViewController: ZMMenuTableViewController {
    
    //builds the array that will be used to list menu items.
    override open func setZMAllMenuItems() {
        //default function is to take the standard items coded into ZMMenuItems.StandardItems
        
        var allZMMenuItems = [ZMMenuItem]()
        
        allZMMenuItems.append(contentsOf: ExampleMenuItems.StandardItems)
        allZMMenuItems.append(contentsOf: ZMMenuItems.StandardItems)
        
        zmAllMenuItems = allZMMenuItems
    }
    
}
