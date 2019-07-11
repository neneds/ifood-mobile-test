//
//  UserTweetCellViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/10/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation

class UserTweetCellViewModel: BaseViewModel {
    private var tweet: Tweet
    
    var tweetContent: String {
        return tweet.text ?? BaseLocalizable.emptyTitleDefault
    }
    
    var tweetUserName: String {
        return tweet.user?.name ?? "--"
    }
    
    var tweetUserImageURL: URL? {
        if let profilePicString = tweet.user?.profileImageURLHTTPS {
            return URL(string: profilePicString)
        }
        return nil
    }
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
}
