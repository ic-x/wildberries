//
//  ImageCache.swift
//

import UIKit

public protocol ImageCache {
    subscript(_ key: String) -> UIImage? { get set }
}

public class TempImageCache: ImageCache {
    private let cache = NSCache<NSString, UIImage>()
    
    public static let shared = TempImageCache()
    
    public subscript(key: String) -> UIImage? {
        get { cache.object(forKey: key as NSString) }
        set {
            if let newValue = newValue {
                cache.setObject(newValue, forKey: key as NSString)
            } else {
                cache.removeObject(forKey: key as NSString)
            }
        }
    }
}
