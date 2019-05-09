//
//  CacheItem.swift
//  CachingImages
//
//  Created by Surendra on 09/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import Foundation

final class CacheItem<T>: NSDiscardableContent {
    let item: T
    init(withCachingItem item: T) {
        self.item = item
    }
    
    func beginContentAccess() -> Bool {
        return true
    }
    
    func endContentAccess() {
        // No implementation required at present
    }
    
    func discardContentIfPossible() {
        // No implementation required at present
    }
    
    func isContentDiscarded() -> Bool {
        return false
    }
}
