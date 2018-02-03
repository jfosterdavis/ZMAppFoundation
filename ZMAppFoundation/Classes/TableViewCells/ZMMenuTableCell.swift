//
//  ZMMenuTableCell.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import Foundation
import UIKit

@IBDesignable
class ZMMenuTableCell: UITableViewCell {
    
    @IBOutlet weak var menuItemLabel: UILabel!
    
    func loadCell(from menuItem: ZMMenuItem) {
        menuItemLabel.text = menuItem.displayTitle
        //destinationVC = menuItem.destinationVC
        
        if let menuItemIcon = menuItem.displayIcon {
            //menuItemIconImageView.image = menuItemIcon
        }
    }
}
