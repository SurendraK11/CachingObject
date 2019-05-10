# Caching Image in NSCache

Used NSDiscardableContent for not to evict cached image from NSCache when app goes into background


CacheItem<T> is geneic class, confirms NSDiscardableContent. Main objective of this class is to wrap item in stored property 
CacheItemProtocol is generic protocol, which provide interface to cache/ retrieve, remove item
NonPersistantObjectCache<T> is generic non persitant object cache class, which cache of given type 
  
To initialze to caches UIImage
let nonPersistantImageCache = NonPersistantObjectCache<UIImage>.init()
