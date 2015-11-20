//
//  PHValidationRule.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 11.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public class PHValidationRule {
    public let predicate: NSPredicate
    public let errorMessage: String?
    
    public init(predicate: NSPredicate, errorMessage: String? = nil) {
        self.predicate = predicate
        self.errorMessage = errorMessage
    }
    
    public convenience init(predicateString: String, substitutions: [String : AnyObject]? = nil, errorMessage: String? = nil) {
        let predicate = NSPredicate(format: predicateString)
        
        if let substitutions = substitutions {
            if substitutions.count > 0 {
                predicate.predicateWithSubstitutionVariables(substitutions)
            }
        }
        
        self.init(predicate: predicate, errorMessage: errorMessage)
    }
    
    public class func validationRules(withPredicatesAndErrorMessages predicates: [String: String?], usingSubstitutions substitutions: [String : AnyObject]? = nil) -> [PHValidationRule] {
        var rules = [PHValidationRule]()
        
        for (predicate, errorMessage) in predicates {
            let validationRule = PHValidationRule(predicateString: predicate, substitutions: substitutions, errorMessage: errorMessage)
            rules.append(validationRule)
        }
        
        return rules
    }
}