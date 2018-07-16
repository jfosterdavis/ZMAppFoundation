//
//  ZMMenuItems.swift
//  ZMAppFoundation
//
//  Created by Jacob Foster Davis on 1/28/18.
//

import Foundation
import UIKit

public struct ZMMenuItems {
    
    static let MenuBundle:Bundle = Bundle(for: ZMMenuItem.self)
    
    public static let StandardItems: [ZMMenuItem] = [Acknowledgement
    ]
    
    public static var CustomItems = [ZMMenuItem]()
    
    static let Acknowledgement = ZMMenuItem(displayTitle: "Acknowledgements",
                                            destinationVC: UIStoryboard(name: "ZMAppFoundation", bundle: MenuBundle).instantiateViewController(withIdentifier: "Acknowledgements"),
                                            displayIcon: nil)
    
}

public struct ZMAcknowledgementsContent {
    public static let StandardContent: [String] = [Copyright, ZMFoundation]
    
    public static var CustomContent = [String]()
    
    static let Copyright = "Copyright (c) 2018 Zero Mu, LLC"
    
    static let ZMFoundation = "This app uses the ZMAppFoundation framework to deliver you a consistent and well-tested app experience.  https://cocoapods.org/pods/ZMAppFoundation"

}
