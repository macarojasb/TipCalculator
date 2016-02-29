//
//  Tweet.swift
//  Twitter
//
//  Created by Maca A. Rojas Bustamante on 2/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var user: User?
    var tweetID: NSNumber?
    
    var text: String?
    var timeStamp: NSDate?
  
    
    init(dictionary: NSDictionary){
        
        user = User(dictionary: (dictionary["user"] as? NSDictionary)!)
        tweetID = dictionary["id"] as? Int
        text = dictionary["text"] as? String
      
        
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString{
            let formatter = NSDateFormatter()
            formatter.timeZone = NSTimeZone(name: "EST")
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timeStamp = formatter.dateFromString(timestampString)
        }
    }
    
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        
        var tweets = [Tweet]()
        
        for dictionary in dictionaries{
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }
    
    
}
