//
//  ViewController.swift
//  ZMAppFoundation
//
//  Created by jfosterdavis on 01/20/2018.
//  Copyright (c) 2018 jfosterdavis. All rights reserved.
//  reboot July 2018

import UIKit
import ZMAppFoundation

class ViewController: UIViewController {

    @IBOutlet weak var gauge: ZMGaugeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gauge.titleLabel.text = "set this title text in viewDidLoad"
        gauge.gaugeIndicatedValue = 9
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

