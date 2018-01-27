//
//  ZMGaugeView.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/22/18.
//

import UIKit
import GaugeKit

@IBDesignable
open class ZMGaugeView: ZMXibView {

    
    @IBOutlet open weak var titleLabel: UILabel!
    @IBOutlet open weak var valueLabel: UILabel!
    @IBOutlet weak var gauge: Gauge!
    
    /******************************************************/
    /*******************///MARK: setting gauge appearance
    /******************************************************/

    /**
     Sets the maximum value of the gauge
     */
    open var maxValue: CGFloat = 10 {
        didSet {
            self.xibSetup()
        }
    }
    
    /**
     Sets the current value that the gauge is indicating
     */
    @IBInspectable open var indicatedValue: CGFloat = 3 {
        didSet {
            self.xibSetup()
        }
    }
    
    /**
     Sets the thickness of the curve on the gauge
     */
    open var curveThickness: CGFloat? = nil {
        didSet {
            if self.curveThickness != nil {
                self._curveThickness = self.curveThickness!
                self.xibSetup()
            }
        }
    }
    /**
     The actual value of curveThickness to be used when loading the xib.  This private var allows the xibSetup to set the thickness as a part of the normal Zero Mu look and feel while still allowing this property to be altered during implementation.
     */
    private var _curveThickness: CGFloat = 1
    
    /**
     updates the properties of the GaugeKit gague.  should be called after changing a gauge property of the ZMGaugeView.  Call after the gauge object is loaded.  This should be the only function that touches the gauge object.
     */
    private func refreshGauge() {
        //maxValue
        gauge.maxValue = self.maxValue
        //indicatedValue
        gauge.rate = self.indicatedValue
        //curveThickness
        gauge.lineWidth = self._curveThickness
    }
    
    /******************************************************/
    /*******************///MARK: Xib IB functions
    /******************************************************/

    
    override open func xibSetup() {
        super.xibSetup()
        
        
        //default for ZM curves is a certain thickness to the curve
        //make the thickness 1/5 the radius of the curve.
        var newThickness:CGFloat = 5
        //only do this if the user hasn't overridden the thickness by using curveThickness
        if let gaugeContentView = self.contentView, self.curveThickness == nil {
            let radius = gaugeContentView.frame.height
            newThickness = radius/5
            self._curveThickness = newThickness
        } else {
            self._curveThickness = 25
        }
        
        //take all current configuration properties of the gauge and refresh the gauge.
        refreshGauge()
        
    }
    
    override open func prepareForInterfaceBuilder() {
        
        if self.nibName == nil {
            self.nibName = "ZMGauge"
        }
        super.prepareForInterfaceBuilder()
        self.titleLabel.text = "This is the title for IB"
    }
}
