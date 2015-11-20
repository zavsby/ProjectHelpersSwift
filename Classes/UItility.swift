//
//  UItility.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 05.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public class Utility {
    public class func classNameAsString(obj: Any) -> String {
        return _stdlib_getDemangledTypeName(obj).componentsSeparatedByString(".").last!
    }
}

public class Locale {
    public static func string(key: String, comment: String = "") -> String {
        return NSLocalizedString(key, comment: comment)
    }
}