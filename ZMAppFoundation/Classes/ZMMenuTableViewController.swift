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
    let tableHeaderViewNibName = "ZMMenuTableHeaderView"
    
    /******************************************************/
    /*******************///MARK: IBInspectable properties
    /******************************************************/

    /**
     Sets the color of the gauge value indicator curve.  This is done in cellForRow
     */
    @IBInspectable open var cellBGColor: UIColor = UIColor.purple
    
    
    
    /******************************************************/
    /*******************///MARK: Life Cycle
    /******************************************************/

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Set the bundle
        let bundle = Bundle(for: type(of: self))
        
        // Register table cell class from nib
        let cellNib = UINib(nibName: tableCellNibName, bundle: bundle)
        tableView.register(cellNib, forCellReuseIdentifier: self.tableCellId)
        
        //Register the header view
        let headerNib = UINib(nibName: tableHeaderViewNibName, bundle: bundle)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: tableHeaderViewNibName)
        
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
        
        //set the appearance based on IBDesignables in this class.  do this before loadCell.
        cell.bgColor = cellBGColor
        
        cell.loadCell(from: menuItem)
    
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menuItem = ZMMenuItems.StandardItems[indexPath.row]
        
        menuItem.itemSelected()
    }
    
    /******************************************************/
    /*******************///MARK: Fancy Tableview settings
    /******************************************************/

    override public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        
        //let headerImageView = UIImageView()
        let anImage:UIImage = UIImage(named: "mosque", in: bundle, compatibleWith: nil)!
        //headerImageView.image = bgImage
        //headerImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableHeaderViewNibName) as! ZMMenuTableHeaderView
        
        //let zmHeader = ZMMenuTableHeaderView()
        header.bgImageView.image = anImage
        //header.addSubview(zmHeader)
        return header
    }
    
    override public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    
}
