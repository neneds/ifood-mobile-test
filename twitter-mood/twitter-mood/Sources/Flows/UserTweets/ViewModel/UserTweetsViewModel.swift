//
//  UserTweetsViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation

class UserTweetsViewModel: BaseViewModel {
    
    private var twitterService: TwitterServiceType
    private(set) var username: String
    
    init(username: String, twitterService: TwitterServiceType) {
        self.username = username
        self.twitterService = twitterService
    }
}
