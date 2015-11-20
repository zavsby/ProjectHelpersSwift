//
//  DateFormatter.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 05.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public class DateFormatter {
    private static var formattersCache = [String: NSDateFormatter]();
    
    public static func dateFormatterWithFormat(format: String) -> NSDateFormatter {
        return dateFormatterWithFormat(format, locale: nil)
    }
    
    public static func dateFormatterWithFormat(format: String, locale: NSLocale?) -> NSDateFormatter {
        if let formatter = formattersCache[format] {
            return formatter
        } else {
            let formatter = NSDateFormatter()
            formatter.dateFormat = format
            formatter.locale = locale ?? NSLocale.currentLocale()
            
            formattersCache[format] = formatter
            
            return formatter
        }
    }
    
    public static func clearCache() {
        formattersCache.removeAll()
    }
}
