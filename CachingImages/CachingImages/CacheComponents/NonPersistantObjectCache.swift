//
//  ImageCache.swift
//  CachingImages
//
//  Created by Surendra on 03/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import Foundation

struct NonPersistantObjectCache<T>:  CacheItemProtocol {
    typealias item = T
    
    private let cachedImages: NSCache<NSString, CacheItem<T>>
    
    init() {
        self.cachedImages = NSCache()
    }
    
    func cacheItem(_ item: item, forKey key: String) {
        let cacheImage = CacheItem<T>.init(withCachingItem: item)
        self.cachedImages.setObject(cacheImage, forKey: key as NSString)
    }
    
    func cachedItemForKey(_ key: String) -> item? {
        return self.cachedImages.object(forKey: key as NSString)?.item
    }
    
    func removeCacheItemForKeys(_ keys: [String]) {
        for key in keys {
            self.cachedImages.removeObject(forKey: key as NSString)
        }
    }
    
    func removeAllCachedItem() {
        self.cachedImages.removeAllObjects()
    }
    
}

