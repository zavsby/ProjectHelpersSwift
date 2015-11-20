//
//  PHValidatableObject.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 11.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public class PHValidatableObject {
    public var validationErrors: [String] = []
    private let validationRules: [PHValidationRule]
    
    public init(rules: [PHValidationRule]) {
        self.validationRules = rules
    }
    
    public func validateWithRules(rules: [PHValidationRule]) -> Bool {
        validationErrors.removeAll()
        
        var isValid = true
        
        for rule in rules {
            let predicate = rule.predicate
            
            
        }
        
        return isValid
    }
    
    public func validate() -> Bool {
        return validateWithRules(validationRules)
    }
}