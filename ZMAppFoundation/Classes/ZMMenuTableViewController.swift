//
//  ZMMenuTableViewController.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/29/18.
//

import UIKit

@IBDesignable
open class ZMMenuTableViewController: UITableViewController {

    public let tableCellId = "ZMMenuTableCell"
    public let tableCellNibName = "ZMMenuTableCell"
    public let tableHeaderViewNibName = "ZMMenuTableHeaderView"
    public let tableFooterViewNibName = "ZMMenuTableFooterView"
    
    open var zmAllMenuItems = [ZMMenuItem]()
    
    /******************************************************/
    /*******************///MARK: IBInspectable properties
    /******************************************************/

    /**
     Sets the color of the gauge value indicator curve.  This is done in cellForRow
     */
    @IBInspectable open var cellBGColor: UIColor = UIColor.purple
   
    @IBInspectable open var topHeaderImage: UIImage?
    @IBInspectable open var topHeaderHeight: CGFloat = 0
    @IBInspectable open var bottomFooterImage: UIImage?
    @IBInspectable open var bottomFooterHeight: CGFloat = 0
    
    
    
    /******************************************************/
    /*******************///MARK: Life Cycle
    /******************************************************/

    
    override open func viewDidLoad() {
        super.viewDidLoad()
                
        // Set the bundle
        let bundle = Bundle(for: ZMMenuTableViewController.classForCoder())
        
        // Register table cell class from nib
        let cellNib = UINib(nibName: tableCellNibName, bundle: bundle)
        tableView.register(cellNib, forCellReuseIdentifier: self.tableCellId)
        
        //Register the header view
        let headerNib = UINib(nibName: tableHeaderViewNibName, bundle: bundle)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: tableHeaderViewNibName)
        
        //Register the footer view
        let footerNib = UINib(nibName: tableFooterViewNibName, bundle: bundle)
        tableView.register(footerNib, forHeaderFooterViewReuseIdentifier: tableFooterViewNibName)
        
        //load the menu items.  This is the function that should be overriden by dev implementing this class.
        setZMAllMenuItems()
    }
    

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************************************/
    /*******************///MARK: Delegate and DataSource
    /******************************************************/
    
    /******** functions to be overriden by subclasses dev ****/
    
    //builds the array that will be used to list menu items.  This array is stored in
    open func setZMAllMenuItems() {
        //default function is to take the standard items coded into ZMMenuItems.StandardItems
        
        var allZMMenuItems = [ZMMenuItem]()
        allZMMenuItems.append(contentsOf: ZMMenuItems.StandardItems)
        
        zmAllMenuItems = allZMMenuItems
    }

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zmAllMenuItems.count
    }
    
    //this function not intended to be overridden
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath as IndexPath) as! ZMMenuTableCell
        
        
        let menuItem = zmAllMenuItems[indexPath.row]
        
        //set the appearance based on IBDesignables in this class.  do this before loadCell.
        cell.bgColor = cellBGColor
        
        cell.loadCell(from: menuItem)
    
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menuItem = zmAllMenuItems[indexPath.row]
        
        menuItem.itemSelected()
    }
    
    /******************************************************/
    /*******************///MARK: Fancy Tableview settings
    /******************************************************/

    override open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        
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
    
    override open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        
        
        //dequeue the footer view
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: tableFooterViewNibName) as! ZMMenuTableFooterView
        //if the user set an image for this table
        if let bootomFooterImage = bottomFooterImage {
            //get the image to put in the background
            //        let bundle = Bundle(for: type(of: self))
            //        let headerImage:UIImage = UIImage(named: "mosque", in: bundle, compatibleWith: nil)!
            
            //give the image to the headerview
            footer.iconImageView.image = bootomFooterImage
        }
        
        
        return footer
    }
    
    override open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
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
    
    override open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        //the footer image only shows in section 0
        if section == 0 {
            
            //if there is an image set for the top image
            if let bottomFooterImage = bottomFooterImage {
                //if the specified a height is more than default of 0, use the specified height
                if bottomFooterHeight != 0 {
                    return bottomFooterHeight
                } else {  //else show size derrived from the image height
                    return bottomFooterImage.size.height
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
