//
//  PHSettingsManager.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 06.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

/**
 *  Stores and returns custom application settings.
 */
public class PHSettingsManager {
    private let storage: PHSettingsStorageProtocol
    
    public init(storage: PHSettingsStorageProtocol) {
        self.storage = storage
    }
    
    // MARK:- Public methods
    
    public func saveObject<T: AnyObject>(obj: T, forKey key: String) {
        storage.saveObject(obj, forKey: key)
    }
    
    public func removeObjectForKey(key: String) {
        storage.removeObjectForKey(key)
    }
    
    public func clearStorage() {
        storage.clearStorage()
    }
    
    public func clearCache() {
        if storage.supportsCache() {
            storage.invalidateCache()
        }
    }
    
    // MARK:- Getters
    
    public func integerForKey(key: String) -> Int? {
        return storage.objectForKey(key) as? Int
    }
    
    public func doubleForKey(key: String) -> Double? {
        return storage.objectForKey(key) as? Double
    }
    
    public func stringForKey(key: String) -> String? {
        return storage.objectForKey(key) as? String
    }
    
    public func boolForKey(key: String) -> Bool? {
        return storage.objectForKey(key) as? Bool
    }
    
    public func arrayForKey(key: String) -> [AnyObject]? {
        return storage.objectForKey(key) as? [AnyObject]
    }
    
    public func dictionaryForKey(key: String) -> [String: AnyObject]? {
        return storage.objectForKey(key) as? [String: AnyObject]
    }
    
    public func dateForKey(key: String) -> NSDate? {
        return storage.objectForKey(key) as? NSDate
    }
}