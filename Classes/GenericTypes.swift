//
//  GenericTypes.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 03.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

// MARK:- Generic errors

public enum GenericError: ErrorType {
    case ArgumentException(argument: String)
}

// MARK:- Generic constants

public struct GenericConstants {
    public static let OneDevicePixel = 1.0 / Double(UIScreen.mainScreen().scale)
}

// MARK:- Generic blocks

public typealias VoidBlock = ()->()