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
//        let tableNib = UINib(nibName: "ZMMenuTable", bundle: bundle)
//        let tableNibView = tableNib.instantiate(
//            withOwner: self,
//            options: nil).first as? UIView
        
        // Then delegate the TableView
        self.tableViewContainer.tableView.delegate = self
        self.tableViewContainer.tableView.dataSource = self
        
        // Set resizable table bounds
//        self.tableViewContainer.tableView.frame = self.view.bounds
//        self.tableViewContainer.tableView.autoresizingMask =             [.flexibleWidth, .flexibleHeight]
        
        // Register table cell class from nib
        let cellNib = UINib(nibName: "ZMMenuTableCell", bundle: bundle)
        self.tableViewContainer.tableView.register(cellNib, forCellReuseIdentifier: self.tableCellId)
        
        // Display table with custom cells
//        self.view.addSubview(tableNibView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
