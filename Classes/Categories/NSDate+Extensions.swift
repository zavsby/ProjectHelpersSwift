//
//  NSDate+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 05.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public extension NSDate {
    
    // MARK:- Initializers
    
    public static func dateWithDay(day: Int, month: Int, year: Int) -> NSDate? {
        let components = NSDateComponents()
        components.day = day
        components.month = month
        components.year = year
        return NSCalendar.currentCalendar().dateFromComponents(components)
    }
    
    public static func dateFromString(dateString: String, format: String) -> NSDate? {
        guard dateString.anyText && format.anyText else {
            return nil
        }
        
        let dateFormatter = DateFormatter.dateFormatterWithFormat(format)
        return dateFormatter.dateFromString(dateString)
    }
    
    // MARK:- Formatting
    
    public func formattedDate(format: String) -> String {
        let dateFormatter = DateFormatter.dateFormatterWithFormat(format)
        return dateFormatter.stringFromDate(self)
    }
    
    // MARK:- Converting dates
    
    public func dateOfDayBeginning() -> NSDate {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: self)
        
        return calendar.dateFromComponents(components)!
    }
}