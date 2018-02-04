//
//  ZMGaugeView.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/22/18.
//

import UIKit
import GaugeKit

@IBDesignable
open class ZMGaugeView: UIView, ZMXib {
    
    @IBOutlet open weak var titleLabel: UILabel!
    @IBOutlet open weak var valueLabel: UILabel!
    @IBOutlet weak var gauge: Gauge!
    
    /******************************************************/
    /*******************///MARK: ZMXib Properties
    /******************************************************/

    var zmXibContentView: UIView?
    
    @IBInspectable var nibName: String?
    
    /******************************************************/
    /*******************///MARK: setting gauge appearance
    /******************************************************/

    /**
     Sets the maximum value of the gauge
     */
    open var gaugeMaxValue: CGFloat = 10 {
        didSet {
            self.xibSetup()
            
        }
    }
    
    /**
     Sets the current value that the gauge is indicating
     */
    public var gaugeIndicatedValue: CGFloat = 3 {
        didSet {
            
            gauge.animateRate(0.5, newValue: gaugeIndicatedValue, completion: {_ in })
            //self.xibSetup()
            refreshGauge()
        }
    }
    
    /**
     Sets the color of the gauge value indicator curve
     */
    @IBInspectable open var gaugeIndicatorColor: UIColor = UIColor.purple {
        didSet {
            self.xibSetup()
        }
    }
    /**
     Sets the background of the gauge indicator
     */
    @IBInspectable open var gaugeBackgroundColor: UIColor? {
        didSet {
            self.xibSetup()
        }
    }
    
    /**
     Sets the background of the gauge indicator
     */
    open var gaugeType: GaugeType = .circle {
        didSet {
            self.xibSetup()
        }
    }
    
    /**
     Sets the thickness of the curve on the gauge
     */
    open var gaugeCurveThickness: CGFloat? = nil {
        didSet {
            if self.gaugeCurveThickness != nil {
                self._gaugeCurveThickness = self.gaugeCurveThickness!
                self.xibSetup()
            }
        }
    }
    /**
     The actual value of curveThickness to be used when loading the xib.  This private var allows the xibSetup to set the thickness as a part of the normal Zero Mu look and feel while still allowing this property to be altered during implementation.
     */
    private var _gaugeCurveThickness: CGFloat = 1
    
    /**
     updates the properties of the GaugeKit gague.  should be called after changing a gauge property of the ZMGaugeView.  Call after the gauge object is loaded.  This should be the only function that touches the gauge object.
     */
    private func refreshGauge() {
        //maxValue
        gauge.maxValue = self.gaugeMaxValue
        //indicatedValue
        //gauge.rate = self.gaugeIndicatedValue
        //indicator color
        gauge.startColor = self.gaugeIndicatorColor
        //backgroundcolor
        gauge.bgColor = self.gaugeBackgroundColor
        //gaugeType
        gauge.type = self.gaugeType
        //curveThickness
        gauge.lineWidth = self._gaugeCurveThickness
        
        //update slaved labels
        setValueLabelFromGauge()
    }
    
    /******************************************************/
    /*******************///MARK: Non-gauge elements
    /******************************************************/

    /**
     Reads the value of the gauge and sets the label text
     */
    open func setValueLabelFromGauge() {
        let value = gaugeIndicatedValue / gaugeMaxValue
        let roundedValue:Int = Int((100*value).rounded())
        let valueDisplayString = "\(roundedValue)%"
        
        valueLabel.text = valueDisplayString
    }
    
    /******************************************************/
    /*******************///MARK: ZMXib Protocol Functions
    /******************************************************/

    override open func awakeFromNib() {
                super.awakeFromNib()
                xibSetupFunctions()
            }
    
    /**
     A custom "override" of xibSetup that adds some stuff on at the end.  Used in awakeFromNib
     */
    open func xibSetupFunctions() {
        xibSetup()
        
        /******************************************************/
        /*******************///MARK: Default gauge thickness
        /******************************************************/
        //default for ZM curves is a certain thickness to the curve
        //make the thickness 1/5 the radius of the curve.
        var newThickness:CGFloat = 5
        //only do this if the user hasn't overridden the thickness by using curveThickness
        if let gaugeContentView = self.zmXibContentView, self.gaugeCurveThickness == nil {
            let radius = gaugeContentView.frame.height
            newThickness = radius/5
            self._gaugeCurveThickness = newThickness
        } else {
            self._gaugeCurveThickness = 25
        }
        
        /******************************************************/
        /*******************///MARK: Default gauge values for ZM
        /******************************************************/
        //don't round the ends of the indicator.
        gauge.roundCap = false
        
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
