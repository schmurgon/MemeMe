//
//  SentMemesViewController.swift
//  ImagePicker
//
//  Created by Ben Scott on 18/05/2015.
//  Copyright (c) 2015 Schmurgon Pty Ltd. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.translucent = false;
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeCell") as! UITableViewCell
        cell.separatorInset = UIEdgeInsetsZero;
        
        let meme = Meme.loadMemeAtIndexPath(indexPath.row)
        let imageView = cell.viewWithTag(100) as! UIImageView
        let textLabel = cell.viewWithTag(200) as! UILabel
        
        imageView.image = meme.memedImage
        textLabel.text = meme.topText
        return cell;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

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