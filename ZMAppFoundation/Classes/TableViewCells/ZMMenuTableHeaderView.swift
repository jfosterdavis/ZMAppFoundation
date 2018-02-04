//
//  ZMMenuTableHeaderView.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 2/4/18.
//

import UIKit

class ZMMenuTableHeaderView: UITableViewHeaderFooterView, ZMXib {
    
    
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    open var bgImage:UIImage?
    
    /******************************************************/
    /*******************///MARK: ZMXib Protocol Properties
    /******************************************************/
    
    
    var zmXibContentView: UIView?
    var nibName: String?
    
    /******************************************************/
    /*******************///MARK: Life cycle
    /******************************************************/

    
    override public func draw(_ rect: CGRect) {
        
        if let bgImage = bgImage {
            bgImageView.image = bgImage
        }
    }
    
    /******************************************************/
    /*******************///MARK: ZMXib Protocol functions
    /******************************************************/

    override open func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
}
