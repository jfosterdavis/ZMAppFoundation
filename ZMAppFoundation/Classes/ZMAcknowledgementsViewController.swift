//
//  ZMAcknowledgementsViewController.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import Foundation
import UIKit

open class ZMAcknowledgementsViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBAction func doneButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}
