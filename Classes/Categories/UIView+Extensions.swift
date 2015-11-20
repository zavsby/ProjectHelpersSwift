//
//  UIView+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 02.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    //MARK: View frame and dimensions
    
    public var top: Float {
        get {
            return Float(self.frame.origin.y)
        }
        set(top) {
            var frame = self.frame
            frame.origin.y = CGFloat(top)
            self.frame = frame
        }
    }
    
    public var left: Float {
        get {
            return Float(self.frame.origin.x)
        }
        set(left) {
            var frame = self.frame
            frame.origin.x = CGFloat(left)
            self.frame = frame
        }
    }
    
    public var bottom: Float {
        get {
            return Float(self.frame.origin.y + self.frame.size.height)
        }
        set(bottom) {
            var frame = self.frame
            frame.origin.y = CGFloat(bottom) - frame.size.height
            self.frame = frame
        }
    }
    
    public var right: Float {
        get {
            return Float(self.frame.origin.x + self.frame.size.width)
        }
        set(right) {
            var frame = self.frame
            frame.origin.x = CGFloat(right) - frame.size.width
            self.frame = frame
        }
    }
    
    public var height: Float {
        get {
            return Float(self.frame.size.height)
        }
        set(height) {
            var frame = self.frame
            frame.size.height = CGFloat(height)
            self.frame = frame
        }
    }
    
    public var width: Float {
        get {
            return Float(self.frame.size.width)
        }
        set(width) {
            var frame = self.frame
            frame.size.width = CGFloat(width)
            self.frame = frame;
        }
    }
    
    //MARK: Addtional methods
    
    public func screenImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let copiedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return copiedImage
    }
    
}