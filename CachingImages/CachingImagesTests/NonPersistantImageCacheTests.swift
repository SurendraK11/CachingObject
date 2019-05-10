//
//  NonPersistantImageCacheTests.swift
//  CachingImagesTests
//
//  Created by Surendra on 09/05/2019.
//  Copyright © 2019 Surendra. All rights reserved.
//

import XCTest
@testable import CachingImages

class NonPersistantImageCacheTests: XCTestCase {

    let imageCache = (UIApplication.shared.delegate as? AppDelegate)?.nonPersistantImageCache
    let imageCacheKey = "imageCacheKey"
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCachingImageIntoNonPersistantImageCache() {
        let imageToBeChached = #imageLiteral(resourceName: "TestImage")
        imageCache?.cacheItem(imageToBeChached, forKey: imageCacheKey)
        let retrievedImage = self.imageCache?.cachedItemForKey(self.imageCacheKey)
        XCTAssertEqual(imageToBeChached, retrievedImage, "Chached image should be equal to retrieved image")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
