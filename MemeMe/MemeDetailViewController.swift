//
//  SentMemeController.swift
//  ImagePicker
//
//  Created by Ben Scott on 27/06/2015.
//  Copyright (c) 2015 Schmurgon Pty Ltd. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController
{
    var memeIndex: Int?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewWillAppear(animated: Bool) {
        let meme = Meme.loadMemeAtIndexPath(memeIndex!)
        imageView.image = meme.memedImage
        
        var deleteButton : UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: "deleteMeme")
        
        navigationItem.rightBarButtonItem = deleteButton
    }
    
    func deleteMeme() {
        Meme.deleteMemeAtIndexPath(memeIndex!)
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}