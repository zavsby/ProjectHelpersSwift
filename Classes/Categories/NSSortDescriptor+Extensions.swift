//
//  NSSortDescriptor+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 03.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public extension NSSortDescriptor {
    
    struct Constants {
        static let ascendingString = "asc"
        static let descendingString = "desc"
    }
    
    public class func sortDescriptorsFromString(string: String) -> [NSSortDescriptor] {
        guard string.anyText else {
            return []
        }
        
        var sortDescriptors: [NSSortDescriptor] = []
        let fields = string.componentsSeparatedByString(", ")
        
        let lastFieldComponents = fields.last?.componentsSeparatedByString(" ")
        let isAscending = lastFieldComponents?.count > 1 ? try! isAscendingString(fields[1]) : true
        
        for sortField in fields {
            let components = sortField.componentsSeparatedByString(" ")
            
            if let component = components.first {
                let isFieldAscending = components.count > 1 ? try! isAscendingString(components[1]) : isAscending
                
                sortDescriptors.append(NSSortDescriptor(key: component, ascending: isFieldAscending))
            }
        }
        
        return sortDescriptors
    }
    
    // MARK:- Private methods
    
    private class func isAscendingString(string: String) throws -> Bool {
        if string == Constants.ascendingString {
            return true
        }
        if string == Constants.descendingString {
            return false
        }
        
        throw GenericError.ArgumentException(argument: string)
    }
    
}