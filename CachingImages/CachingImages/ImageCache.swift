//
//  ImageCache.swift
//  CachingImages
//
//  Created by Surendra on 03/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import Foundation
import UIKit


protocol CacheItemProtocol {
    associatedtype item
    func cacheItem(_  item: item, forKey key: String)
    func cacheItemForKey(_ key: String) -> item?
    func removeCacheItemForKeys(_ keys: [String])
    func removeAllCachedItem()
}


struct NonPersistantImageCache:  CacheItemProtocol {
    typealias item = UIImage
    
    private let cachedImages: NSCache<NSString, CacheItem<item>>
    static let shared = NonPersistantImageCache()
    
    private init() {
        self.cachedImages = NSCache()
        self.cachedImages.name = "ImageCache"
    }
    
    func cacheItem(_ item: UIImage, forKey key: String) {
        let cacheImage = CacheItem<UIImage>.init(withCachingItem: item)
        self.cachedImages.setObject(cacheImage, forKey: key as NSString)
    }
    
    func cacheItemForKey(_ key: String) -> UIImage? {
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

