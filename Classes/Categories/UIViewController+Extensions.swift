//
//  UIViewController+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 01.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public typealias KeyboardObserverBlock = (keyboardHeight: Double) -> ()

public extension UIViewController {
    public func addChildViewController(vc: UIViewController, onView view: UIView) {
        view.addSubview(vc.view)
        self.addChildViewController(vc)
        vc.didMoveToParentViewController(self)
    }
    
    public func removeChildViewControllerFromParent(vc: UIViewController) {
        if vc.parentViewController != nil {
            vc.willMoveToParentViewController(nil)
            vc.view.removeFromSuperview()
            vc.removeFromParentViewController()
        }
    }
    
    // MARK:- Keyboard observing
    
    public func addKeyboardObserverWithShownBlock(shownBlock: KeyboardObserverBlock, dismissBlock: KeyboardObserverBlock) -> NSObjectProtocol {
        return NSNotificationCenter.defaultCenter().addObserverForName(UIKeyboardWillChangeFrameNotification, object: nil, queue: nil) { (note) -> Void in
            if let userInfo = note.userInfo {
                let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
                let animationType = UIViewAnimationOptions(rawValue: (userInfo[UIKeyboardAnimationCurveUserInfoKey] as! UInt) << 16)
                let keyboardHeight = Double(keyboardFrame.size.height)
                
                UIView.animateWithDuration(duration, delay: 0, options:animationType , animations: { () -> Void in
                    if CGRectIntersectsRect(self.view.frame, keyboardFrame) {
                        shownBlock(keyboardHeight: keyboardHeight)
                    } else {
                        dismissBlock(keyboardHeight: keyboardHeight)
                    }
                    }, completion: nil)
            }
        }
    }
    
    public func removeKeyboardObserver(observer: NSObjectProtocol) {
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
}