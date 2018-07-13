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
    
    static let Acknowledgement = ZMMenuItem(displayTitle: "Acknowledgements",
                                            destinationVC: UIStoryboard(name: "ZMAppFoundation", bundle: MenuBundle).instantiateViewController(withIdentifier: "Acknowledgements"),
                                            displayIcon: nil)
    
}
