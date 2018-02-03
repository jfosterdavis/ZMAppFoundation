//
//  ZMMenuTableViewController.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/29/18.
//

import UIKit

class ZMMenuTableViewController: UIViewController {

    @IBOutlet weak var tableViewContainer: ZMMenuTableView!
    
    let tableCellId = "ZMMenuTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // First load table nib
        let bundle = Bundle(for: type(of: self))
        
        // Then delegate the TableView
        self.tableViewContainer.tableView.delegate = self
        self.tableViewContainer.tableView.dataSource = self
        
        // Register table cell class from nib
        let cellNib = UINib(nibName: "ZMMenuTableCell", bundle: bundle)
        self.tableViewContainer.tableView.register(cellNib, forCellReuseIdentifier: self.tableCellId)
                
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
