//
//  CollectionViewController.swift
//  ImagePicker
//
//  Created by Ben Scott on 18/05/2015.
//  Copyright (c) 2015 Schmurgon Pty Ltd. All rights reserved.
//


import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    var cellHeight : CGFloat = 150
    var cellWidth : CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationController!.navigationBar.translucent = false;
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1.0

        // Add an observer for orientation changes so we can adapt the number of image columns
        // displayed
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setCellWidth", name: UIDeviceOrientationDidChangeNotification, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        collectionView.reloadData()
        setCellWidth()
    }
    
    func setCellWidth()
    {
        // Use a different number of images per row depending on the orientation of the device
        if UIDevice.currentDevice().orientation.isLandscape.boolValue
        {
            let cellWidth = ( self.view.bounds.width - 4 ) / 4
            
            layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        }
        else
        {
            let cellWidth = ( self.view.bounds.width - 3 ) / 3
            layout.itemSize = CGSizeMake(cellWidth, cellHeight)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCell", forIndexPath: indexPath) as! MemeCollectionViewCell

        let meme = Meme.loadMemeAtIndexPath(indexPath.row)
        cell.imageView.image = meme.memedImage
        
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("memeDetail", sender: indexPath.row)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if ( segue.identifier == "memeDetail")
        {
            let memeDetailViewController: MemeDetailViewController = segue.destinationViewController as! MemeDetailViewController
            
            let memeIndex = sender as! Int
            memeDetailViewController.memeIndex = memeIndex
        }
    }
}