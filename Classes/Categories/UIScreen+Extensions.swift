//
//  UIScreen+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 02.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen {
    public func orientedScreenSize() -> CGSize {
        let screenSize = UIScreen.mainScreen().bounds.size
        
        if (NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1 && UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation)) {
            return CGSize(width: screenSize.height, height: screenSize.width)
        }
        
        return screenSize
    }
    
    public func orientedScreenHeight() -> Float {
        return Float(orientedScreenSize().height)
    }
    
    public func orientedScreenWidth() -> Float {
        return Float(orientedScreenSize().width)
    }
}