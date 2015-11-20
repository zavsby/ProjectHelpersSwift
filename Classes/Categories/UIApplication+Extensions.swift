//
//  UIApplication+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 03.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    var cachesDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true).first!
    }
    
    var supportDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true).first!
    }
    
    var documentsDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
    }
}