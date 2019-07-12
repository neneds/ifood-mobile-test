//
//  TweetDetailViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation
import RxSwift

class TweetDetailViewModel: BaseViewModel {
    
    private(set) var tweetCellViewModel: UserTweetCellViewModel
    private var googleService: GoogleService
    private(set) var errorObservable = PublishSubject<Error?>()
    private(set) var isLoading: BehaviorSubject = BehaviorSubject<Bool>(value: false)
    private(set) var tweetMood: BehaviorSubject = BehaviorSubject<TweetMoodViewModel?>(value: nil)
    
    var tweetContent: String {
        return tweetCellViewModel.tweetContent
    }
    
    init(tweetCellViewModel: UserTweetCellViewModel, googleService: GoogleService) {
        self.tweetCellViewModel = tweetCellViewModel
        self.googleService = googleService
    }
    
    func loadMoodFromTweet() {
        isLoading.onNext(true)
        googleService.moodForTweet(tweetCellViewModel.tweetContent)
            .map({ TweetMoodViewModel(tweetMood: $0) })
            .subscribe(onSuccess: { [weak self] (mood) in
                self?.isLoading.onNext(false)
                self?.tweetMood.onNext(mood)
            }, onError: { (error) in
                self.isLoading.onNext(false)
                self.errorObservable.onNext(error)
            }).disposed(by: disposeBag)
    }
    
}
