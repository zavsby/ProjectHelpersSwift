//
//  UIDevice+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 05.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIDevice {
    public static var isIpad: Bool {
        return currentDevice().userInterfaceIdiom == .Pad
    }
    
    public static var isPhone: Bool {
        return currentDevice().userInterfaceIdiom == .Phone
    }
    
    public static var isPortraitOrientation: Bool {
        return UIInterfaceOrientationIsPortrait(UIApplication.sharedApplication().statusBarOrientation)
    }
    
    public static var isLandscapeOrientation: Bool {
        return UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)
    }
    
    public static var currentOrientation: UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
}