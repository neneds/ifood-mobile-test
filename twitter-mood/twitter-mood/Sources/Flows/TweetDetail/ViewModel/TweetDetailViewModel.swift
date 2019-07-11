//
//  TweetDetailViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation
import RxSwift

//protocol TweetDetailViewModelOutput {
//    var tweetCellViewModel: UserTweetCellViewModel { get }
//    var googleService: GoogleService { get }
//    var errorMessage: BehaviorSubject<String?> { get }
//    var showLoader: BehaviorSubject<Bool> { get }
//}
//
//protocol TweetDetailViewModelInput {
//    var userName: BehaviorSubject<String?> { get }
//    func findTweets()
//}
//
//typealias TweetDetailViewModelType = TweetDetailViewModelInput & TweetDetailViewModelOutput

class TweetDetailViewModel: BaseViewModel {
    
    private(set) var tweetCellViewModel: UserTweetCellViewModel
    private var googleService: GoogleService
    private(set) var errorObservable = PublishSubject<Error?>()
    private(set) var isLoading: BehaviorSubject = BehaviorSubject<Bool>(value: false)
    private(set) var tweetMood: BehaviorSubject = BehaviorSubject<TweetMood?>(value: nil)
    
    init(tweetCellViewModel: UserTweetCellViewModel, googleService: GoogleService) {
        self.tweetCellViewModel = tweetCellViewModel
        self.googleService = googleService
    }
    
    func loadMoodFromTweet(_ tweetText: String?) {
        isLoading.onNext(true)
        googleService.moodForTweet(tweetText)
            .subscribe(onSuccess: { [weak self] (mood) in
                self?.isLoading.onNext(false)
                self?.tweetMood.onNext(mood)
            }) { (error) in
                self.isLoading.onNext(false)
                self.errorObservable.onNext(error)
            }.disposed(by: disposeBag)
    }
    
}
