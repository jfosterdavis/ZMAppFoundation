//
//  CustomMenuItems.swift
//  ZMAppFoundation_Example
//
//  Created by Jacob Foster Davis on 13Jul18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import ZMAppFoundation
import UIKit

struct CustomMenuItems {
    
    static let MenuBundle:Bundle = Bundle(for: ZMMenuItem.self)
    
    static let Items: [ZMMenuItem] = [AppSpecificMenuItem1, AppSpecificMenuItem2]
    
    static let AppSpecificMenuItem1 = ZMMenuItem(displayTitle: "App Specific Menu Item 1",
                                            destinationVC: UIStoryboard(name: "ZMAppFoundation", bundle: MenuBundle).instantiateViewController(withIdentifier: "Acknowledgements"),
                                            displayIcon: nil)
    
    static let AppSpecificMenuItem2 = ZMMenuItem(displayTitle: "App Specific Menu Item 2",
                                                 destinationVC: UIStoryboard(name: "ZMAppFoundation", bundle: MenuBundle).instantiateViewController(withIdentifier: "Acknowledgements"),
                                                 displayIcon: nil)
    
}
