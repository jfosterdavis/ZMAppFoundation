//
//  ZMMenuTableCell.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import Foundation
import UIKit

class ZMMenuTableCell: UITableViewCell {
    
    @IBOutlet weak var menuItemLabel: UILabel!
    
    var destinationVC: UIViewController!
    
    func loadCell(from menuItem: ZMMenuItem) {
        menuItemLabel.text = menuItem.displayTitle
        destinationVC = menuItem.destinationVC
        
        if let menuItemIcon = menuItem.displayIcon {
            //menuItemIconImageView.image = menuItemIcon
        }
    }
    
    func cellSelected() {
        let topmostVC = topMostController()
        topmostVC.present(destinationVC, animated: true, completion: nil)
    }
    
    /******************************************************/
    /*******************///MARK: Xib IB functions
    /******************************************************/
//    override open func xibSetup() {
//        if self.nibName == nil {
//            self.nibName = "ZMMenuTableCell"
//        }
//        super.xibSetup()
//    }
//
//    override open func prepareForInterfaceBuilder() {
//
//        if self.nibName == nil {
//            self.nibName = "ZMMenuTableCell"
//        }
//        super.prepareForInterfaceBuilder()
//
//    }
}
