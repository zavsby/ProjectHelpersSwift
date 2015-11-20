//
//  PHSettingsStorageProtocol.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 06.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation

/**
 *  Protocol which should be implemented by storage class for settings.
 */
public protocol PHSettingsStorageProtocol {
    
    func saveObject<T: AnyObject>(obj: T, forKey key: String)
    func objectForKey(key: String) -> Any?
    func removeObjectForKey(key: String)
    
    func clearStorage()
    
    // MARK:- Caching
    
    func supportsCache() -> Bool
    func invalidateCache()
}