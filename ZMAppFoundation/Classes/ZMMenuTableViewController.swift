//
//  ZMMenuTableViewController.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/29/18.
//

import UIKit

class ZMMenuTableViewController: UIViewController {

    @IBOutlet weak var menuTableView: ZMMenuTableView!
    
    let tableCellId = "ZMMenuTableCell"
    let tableCellNibName = "ZMMenuTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate the TableView
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
        // Set the bundle
        let bundle = Bundle(for: type(of: self))
        
        // Register table cell class from nib
        let cellNib = UINib(nibName: tableCellNibName, bundle: bundle)
        self.menuTableView.register(cellNib, forCellReuseIdentifier: self.tableCellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
