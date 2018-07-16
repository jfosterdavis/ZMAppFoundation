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
    @IBOutlet weak var textView: UITextView!
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        //load the acknowledgement text
        loadText()
        
    }
    
    func loadText() {
        
        //clear text
        textView.text? = ""
        
        //load text from custom structure
        for ack in ZMAcknowledgementsContent.CustomItems {
            textView.text?.append(contentsOf: ack)
            textView.text?.append("\n\n")
        }
        
        //load standard acks text from data structure
        for ack in ZMAcknowledgementsContent.StandardItems {
            textView.text?.append(contentsOf: ack)
            textView.text?.append("\n\n")
        }
    }
    
    @IBAction func doneButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}
