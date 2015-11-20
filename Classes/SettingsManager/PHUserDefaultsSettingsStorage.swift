//
//  PHUserDefaultsSettingsStorage.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 06.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

public class PHUserDefaultsSettingsStorage {
    private let userDefaults = NSUserDefaults.standardUserDefaults()
    private var settings: [String: Any] = [:]
}

extension PHUserDefaultsSettingsStorage: PHSettingsStorageProtocol {
    
    public func saveObject<T: AnyObject>(obj: T, forKey key: String) {
        userDefaults.setObject(obj, forKey: key)
        settings[key] = obj
    }
    
    public func objectForKey(key: String) -> Any? {
        if let value = settings[key] {
            return value
        } else if let value = userDefaults.objectForKey(key) {
            settings[key] = value
            return value
        } else {
            return nil
        }
    }
    
    public func removeObjectForKey(key: String) {
        userDefaults.removeObjectForKey(key)
        settings.removeValueForKey(key)
    }
    
    public func supportsCache() -> Bool {
        return true
    }
    
    public func invalidateCache() {
        settings.removeAll()
    }
    
    public func clearStorage() {
        let appDomain = NSBundle.mainBundle().bundleIdentifier!
        userDefaults.removePersistentDomainForName(appDomain)
        
        invalidateCache()
    }
    
}