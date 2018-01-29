//
//  ZMMenuTableViewController+TableDelegateDataSource.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: This extension adds UITableView functions
/******************************************************/

extension ZMMenuTableViewController: UITableViewDelegate, UITableViewDataSource  {
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ZMMenuItems.StandardItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath as IndexPath) as! ZMMenuTableCell
        
        let menuItem = ZMMenuItems.StandardItems[indexPath.row]
        
        cell.loadCell(from: menuItem)
        
        return cell
    }
    
    
    
    
}
