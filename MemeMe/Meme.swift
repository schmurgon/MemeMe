//
//  Meme.swift
//  ImagePicker
//
//  Created by Ben Scott on 18/05/2015.
//  Copyright (c) 2015 Schmurgon Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

class Meme: NSObject {
    var topText: String
    var bottomText: String
    var image: UIImage!
    var memedImage: UIImage!
    
    init( topText: String, bottomText:String, image: UIImage!, memedImage: UIImage!)
    {
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memedImage = memedImage
    }
    
    func save()
    {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        
        appDelegate.memes.append(self)
    }
    
    // Loads a Meme from context
    class func loadMemeAtIndexPath( index: Int) -> Meme {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes[index] as Meme
    }
    
    // Deletes a previously saved Meme
    class func deleteMemeAtIndexPath( index: Int )
    {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.removeAtIndex(index)
    }
}
