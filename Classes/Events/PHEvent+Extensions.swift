//
//  PHEvent+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 05.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public extension NSNotification {
    struct Constants {
        static let eventObjectKey = "event_object"
    }
    
    public var event: PHEvent? {
        if let userInfo = self.userInfo, event = userInfo[Constants.eventObjectKey] {
            return event as? PHEvent
        } else {
            return nil
        }
    }
}

public extension NSNotificationCenter {
    // MARK:- Subsribing/unsubscribing
    
    public func subscribe<T: PHEvent>(object: AnyObject, eventType: T.Type, selector: Selector) {
        let notificationName = eventType.notificationName
        
        addObserver(object, selector: selector, name: notificationName, object: nil)
    }
    
    public func unsubcribe<T: PHEvent>(object: AnyObject, eventType: T.Type) {
        let notificationName = eventType.notificationName
        
        removeObserver(object, name: notificationName, object: nil)
    }
    
    // MARK:- Raise
    
    public func raiseEvent(event: PHEvent) {
        raiseEvent(event, fromSender: nil)
    }
    
    public func raiseEvent(event: PHEvent, fromSender sender: AnyObject?) {
        let notificationName = Utility.classNameAsString(event)
        let userInfo = [NSNotification.Constants.eventObjectKey: event]
        
        postNotificationName(notificationName, object: sender, userInfo: userInfo)
    }
}