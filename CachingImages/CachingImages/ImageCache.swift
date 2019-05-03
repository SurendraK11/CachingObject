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
    
    private final class CacheImage: NSDiscardableContent {
        let iamge: UIImage
        init(withCachingImage image: UIImage) {
            self.iamge = image
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
    
    private let cachedImages: NSCache<NSString, CacheImage>
    static let shared = ImageCache()
    
    private init() {
        self.cachedImages = NSCache()
        self.cachedImages.name = "ImageCache"
    }
    
    func cacheImage(_ image: UIImage, forKey key: String) {
        let cacheImage = CacheImage(withCachingImage: image)
        self.cachedImages.setObject(cacheImage, forKey: key as NSString)
    }
    
    func cachedImageForKey(_ key: String) -> UIImage? {
        return self.cachedImages.object(forKey: key as NSString)?.iamge
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
