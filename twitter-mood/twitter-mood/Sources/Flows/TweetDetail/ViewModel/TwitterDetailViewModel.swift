//
//  TwitterDetailViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation

class TwitterDetailViewModel: BaseViewModel {
    private var currentTweet: Tweet!
    private var googleService: GoogleService!
    
    init(tweet: Tweet, googleService: GoogleService) {
        self.currentTweet = tweet
        self.googleService = googleService
    }
    
    
}
