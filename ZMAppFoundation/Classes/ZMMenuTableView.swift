//
//  ZMMenuTableView.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/27/18.
//

import Foundation
import UIKit

@IBDesignable
open class ZMMenuTableView: ZMXibView {
 
    
    /******************************************************/
    /*******************///MARK: Outlets and Actions
    /******************************************************/
   
    @IBOutlet open var homeButton: UIButton!
    
    @IBOutlet var menuButton1: UIButton!
    
    @IBOutlet var parentVC: UIViewController!
    
    /**
     Sets the color of the gauge value indicator curve
     */
//    @IBInspectable open var homeStoryboardID: String = "Home" {
//        didSet {
//            self.xibSetup()
//        }
//    }
    
    /**
     Hooks up the buttons in the xib to items in storyboard
     */
//    private func connectSegues() {
//        self.homeButton.sendAction(#selector("exitMenu"), to: self, for: nil)
//    }
    
    
    /**
     Exits the menu and transitions to the Home view controller
     */
    @IBAction open func exitMenu(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController(), parentVC != nil else { return }
        parentVC.present(vc, animated: true, completion: nil)
    }
    
    @IBAction open func menuItemAcknowledgements(_ sender: UIButton) {
        let bundle = Bundle(for: type(of: self))
        let vc = UIStoryboard(name: "ZMAppFoundation", bundle: bundle).instantiateViewController(withIdentifier: "Acknowledgements")
        parentVC.present(vc, animated: true, completion: nil)
    }
    
    /******************************************************/
    /*******************///MARK: Xib IB functions
    /******************************************************/
    override open func xibSetup() {
        if self.nibName == nil {
            self.nibName = "ZMMenuTable"
        }
        super.xibSetup()
    }
    
    override open func prepareForInterfaceBuilder() {
        
        if self.nibName == nil {
            self.nibName = "ZMMenuTable"
        }
        super.prepareForInterfaceBuilder()
        self.homeButton.setTitle("Home", for: .normal)
        self.menuButton1.setTitle("Menu Item 1", for: .normal)
    }
}
