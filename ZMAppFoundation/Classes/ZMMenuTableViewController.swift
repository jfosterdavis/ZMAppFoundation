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
    @IBInspectable open var topHeaderImage: UIImage?
    @IBInspectable open var topHeaderHeight: CGFloat = 0
    
    
    
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
        
        
        
        //dequeue the header view
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableHeaderViewNibName) as! ZMMenuTableHeaderView
        //if the user set an image for this table
        if let topHeaderImage = topHeaderImage {
            //get the image to put in the background
            //        let bundle = Bundle(for: type(of: self))
            //        let headerImage:UIImage = UIImage(named: "mosque", in: bundle, compatibleWith: nil)!
            
            //give the image to the headerview
            header.bgImageView.image = topHeaderImage
        }
        
        
        return header
    }
    
    override public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        //the header image only shows in section 0
        if section == 0 {
        
            //if there is an image set for the top image
            if let topHeaderImage = topHeaderImage {
                //if the specified a height is more than default of 0, use the specified height
                if topHeaderHeight != 0 {
                    return topHeaderHeight
                } else {  //else show size derrived from the image height
                    return topHeaderImage.size.height
                }
            } else { //if there is no custom image, don't show the top header.
                return 0
            }
        } else {
            //this is not the top section, return tv default as set in IB
            return tableView.sectionHeaderHeight
        }
        
    }
    
    
}
