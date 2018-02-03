//
//  ZMMenuTableViewController.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/29/18.
//

import UIKit

@IBDesignable
class ZMMenuTableViewController: UITableViewController {

    let tableCellId = "ZMMenuTableCell"
    let tableCellNibName = "ZMMenuTableCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Set the bundle
        let bundle = Bundle(for: type(of: self))
        
        // Register table cell class from nib
        let cellNib = UINib(nibName: tableCellNibName, bundle: bundle)
        self.tableView.register(cellNib, forCellReuseIdentifier: self.tableCellId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************************************/
    /*******************///MARK: Delegate and DataSource
    /******************************************************/

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ZMMenuItems.StandardItems.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath as IndexPath) as! ZMMenuTableCell
        
        let menuItem = ZMMenuItems.StandardItems[indexPath.row]
        
        cell.loadCell(from: menuItem)
        
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menuItem = ZMMenuItems.StandardItems[indexPath.row]
        
        menuItem.itemSelected()
    }
}
