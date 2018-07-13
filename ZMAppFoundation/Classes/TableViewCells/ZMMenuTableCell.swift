//
//  ZMMenuTableCell.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import Foundation
import UIKit

@IBDesignable
open class ZMMenuTableCell: UITableViewCell {
    
    @IBOutlet weak var menuItemLabel: UILabel!
    @IBOutlet weak var menuItemIconImageView: UIImageView!
    
    open var bgColor:UIColor = UIColor.white
    
    func loadCell(from menuItem: ZMMenuItem) {
        //set color
        contentView.backgroundColor = bgColor
        
        
        menuItemLabel.text = menuItem.displayTitle
        
        if let menuItemIcon = menuItem.displayIcon {
            menuItemIconImageView.image = menuItemIcon
        }
    }
}
