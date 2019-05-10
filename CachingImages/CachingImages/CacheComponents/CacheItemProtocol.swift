//
//  CacheItemProtocol.swift
//  CachingImages
//
//  Created by Surendra on 10/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import Foundation

protocol CacheItemProtocol {
    associatedtype item
    func cacheItem(_  item: item, forKey key: String)
    func cachedItemForKey(_ key: String) -> item?
    func removeCacheItemForKeys(_ keys: [String])
    func removeAllCachedItem()
}
