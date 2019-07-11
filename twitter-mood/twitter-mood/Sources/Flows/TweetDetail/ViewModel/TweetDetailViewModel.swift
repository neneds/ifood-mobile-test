//
//  TweetDetailViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation

class TweetDetailViewModel: BaseViewModel {
    private var tweetCellViewModel: UserTweetCellViewModel
    private var googleService: GoogleService
    
    init(tweetCellViewModel: UserTweetCellViewModel, googleService: GoogleService) {
        self.tweetCellViewModel = tweetCellViewModel
        self.googleService = googleService
    }
    
    
    
}
