//
//  UserTweetsViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation
import RxSwift

class UserTweetsViewModel: BaseViewModel {
    
    private var twitterService: TwitterServiceType
    private(set) var username: String
    private(set) var isLoading: BehaviorSubject = BehaviorSubject<Bool>(value: false)
    private(set) var errorObservable = PublishSubject<Error?>()
    private(set) var userTweets: BehaviorSubject = BehaviorSubject<[UserTweetCellViewModel]>(value: [])
    
    init(username: String, twitterService: TwitterServiceType) {
        self.username = username
        self.twitterService = twitterService
    }
    
    func loadUserTweets(username: String) {
        isLoading.onNext(true)
        twitterService.fetchTweets(username: username, count: 10)
            .map({ $0.map({ UserTweetCellViewModel(tweet: $0)}) })
            .subscribe(onSuccess: { [weak self] (cellViewModels) in
                self?.isLoading.onNext(false)
                self?.userTweets.onNext(cellViewModels)
            }) { (error) in
             self.isLoading.onNext(false)
             self.errorObservable.onNext(error)
        }.disposed(by: disposeBag)
    }
}
