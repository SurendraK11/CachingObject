//
//  ImageCache.swift
//  CachingImages
//
//  Created by Surendra on 03/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import Foundation
import UIKit

protocol ImageCacheProtocol {
    func cacheImage(_  image: UIImage, forKey key: String)
    func cachedImageForKey(_ key: String) -> UIImage?
    func removeCacheImageForKeys(_ keys: [String])
    func removeAllCachedImage()
}


struct  ImageCache: ImageCacheProtocol {
    
    private let cachedImages: NSCache<NSString, CacheItem<UIImage>>
    static let shared = ImageCache()
    
    private init() {
        self.cachedImages = NSCache()
        self.cachedImages.name = "ImageCache"
    }
    
    func cacheImage(_ image: UIImage, forKey key: String) {
        let cacheImage = CacheItem<UIImage>.init(withCachingItem: image)
        self.cachedImages.setObject(cacheImage, forKey: key as NSString)
    }
    
    func cachedImageForKey(_ key: String) -> UIImage? {
        return self.cachedImages.object(forKey: key as NSString)?.item
    }
    
    func removeCacheImageForKeys(_ keys: [String]) {
        for key in keys {
            self.cachedImages.removeObject(forKey: key as NSString)
        }
    }
    
    func removeAllCachedImage() {
        self.cachedImages.removeAllObjects()
    }
    
    
}
