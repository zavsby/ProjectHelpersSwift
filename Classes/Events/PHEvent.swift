//
//  PHEvent.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 05.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

/**
 *  Base event to be notified using notification center.
 *  Can be subclassed to create custom events.
 */
public class PHEvent {
    internal static var notificationName: String {
        return String(self)
    }
}