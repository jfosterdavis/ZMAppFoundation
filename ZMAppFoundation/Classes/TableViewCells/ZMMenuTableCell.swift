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
    @IBOutlet weak var menuItemIconImageView: UIImageView!
    
    func loadCell(from menuItem: ZMMenuItem) {
        menuItemLabel.text = menuItem.displayTitle
        
        if let menuItemIcon = menuItem.displayIcon {
            menuItemIconImageView.image = menuItemIcon
        }
    }
}
