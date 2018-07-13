//
//  ZMMenuItem.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import UIKit

open class ZMMenuItem: NSObject {

    var displayTitle: String
    var displayIcon: UIImage?
    var destinationVC: UIViewController
    
    // MARK: Initializers
    public init(displayTitle: String,
         destinationVC: UIViewController,
         displayIcon: UIImage? = nil) {
        
        self.displayTitle = displayTitle
        self.destinationVC = destinationVC
        
        self.displayIcon = displayIcon

        super.init()
    }
    
    func itemSelected() {
        let topmostVC = topMostController()
        topmostVC.present(destinationVC, animated: true, completion: nil)
    }
}
