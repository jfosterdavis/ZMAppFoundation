//
//  ZMProtocols.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import Foundation
import UIKit

/******************************************************/
/*******************///MARK: ZMXib
/******************************************************/

protocol ZMXib: class {
    
    var zmXibContentView:UIView? { get set }
    var nibName:String? { get set }
    
    func awakeFromNib()
    func xibSetup()
    func loadViewFromNib() -> UIView?
    func prepareForInterfaceBuilder()
}

/**
 Since I can't set a default for the following function (that I know of), this function should be pasted into each protocol.
 
     override open func awakeFromNib() {
         super.awakeFromNib()
         xibSetup()
     }
 */
extension ZMXib where Self: UIView {
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask =
            [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        zmXibContentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        guard let nibName = nibName else {
            print("nibName is nil for \(type(of: self))")
            return nil
        }
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
    
//    override internal func prepareForInterfaceBuilder() {
//        super.prepareForInterfaceBuilder()
//        xibSetup()
//        zmContentView?.prepareForInterfaceBuilder()
//    }
}

//TODO: Add error user protocol

