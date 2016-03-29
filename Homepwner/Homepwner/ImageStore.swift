//
//  ImageStore.swift
//  Homepwner
//
//  Created by Keval Shah on 3/28/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit
class ImageStore
{
    let cache = NSCache()
    func setImage(image: UIImage, forKey key: String)
    {
        cache.setObject(image, forKey: key)
        
        let imageURL = imageURLForKey(key)
        
        if let data = UIImagePNGRepresentation(image)
        {
            data.writeToURL(imageURL, atomically: true)
        }
    }
    
    func imageForKey(key: String) -> UIImage?
    {
        //return cache.objectForKey(key) as? UIImage
        
        if let existingImage = cache.objectForKey(key) as? UIImage
        {
            return existingImage
        }
        
        let imageURL = imageURLForKey(key)
        guard let imageFromDisk = UIImage(contentsOfFile: imageURL.path!) else
        {
            return nil
        }
        cache.setObject(imageFromDisk, forKey: key)
        return imageFromDisk
    }
    
    func imageURLForKey(key: String) -> NSURL
    {
            let documentsDirectories = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.URLByAppendingPathComponent(key)
    }
    
    func deleteImageForKey(key: String)
    {
        cache.removeObjectForKey(key)
        
        let imageURL = imageURLForKey(key)
        do
        {
            try NSFileManager.defaultManager().removeItemAtURL(imageURL)
        }
        catch
        {
           // print("Error reading fromm the disk: \(error)")        }
            print("Error removing the image from disk")
        }
    
    }
}