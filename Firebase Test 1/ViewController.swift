//
//  ViewController.swift
//  Firebase Test 1
//
//  Created by yn on 6/22/16.
//  Copyright © 2016 yn. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase

import JSQMessagesViewController

// class ViewController: UIViewController {

class ViewController: JSQMessagesViewController {

    var messages: [JSQMessage] = [
        JSQMessage(senderId: "Dummy1", displayName: "Y", text: "Hello there"),
        JSQMessage(senderId: "Dummy2", displayName: "K", text: "What's up")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        senderDisplayName = "DummyA"
        senderId = "Dummy1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }

    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        if messages[indexPath.row].senderId == senderId {
            return
                JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor(red: 254/255, green: 113/255, blue: 103/255, alpha: 1))
        } else{
            return
                JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1))
        }
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as? JSQMessagesCollectionViewCell
        if messages[indexPath.row].senderId == senderId {
            cell?.textView?.textColor = UIColor.whiteColor()
        } else {
            cell?.textView?.textColor = UIColor.darkGrayColor()
        }
        return cell!
        
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return
            JSQMessagesAvatarImageFactory.avatarImageWithUserInitials(messages[indexPath.row].senderDisplayName, backgroundColor: UIColor.lightGrayColor(), textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(10), diameter:30)
    }
    
}

