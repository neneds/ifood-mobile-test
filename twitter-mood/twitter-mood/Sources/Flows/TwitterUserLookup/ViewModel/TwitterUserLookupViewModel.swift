//
//  TwitterUserLookupViewModel.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TwitterUserLookupViewModel: BaseViewModel {
    
    private var twitterService: TwitterServiceType
    
    let userNameValidated: Driver<Bool>
    var userNameInput: BehaviorSubject = BehaviorSubject<String>(value: "")
    private(set) var errorObservable = PublishSubject<Error?>()
    private(set) var isLoading: BehaviorSubject = BehaviorSubject<Bool>(value: false)
    
    init(twitterService: TwitterServiceType) {
        self.twitterService = twitterService
        
        userNameValidated = userNameInput
            .debounce(0.3, scheduler: MainScheduler.instance)
            .map({ (name) -> Bool in
                return InputValidator.validateName(name, minCharacters: 2).isValid
            }).asDriver(onErrorJustReturn: false)
    }
    
    func checkForAuthentication() {
        if NetworkManager.shared.twitterAuthToken() == nil {
            isLoading.onNext(true)
            let result = twitterService.authorize()
            result.subscribe(onSuccess: { [weak self] (token) in
                self?.isLoading.onNext(false)
                self?.handleTwitterTokenStore(token)
            }) { (error) in
                self.isLoading.onNext(false)
                self.errorObservable.onNext(error)
                print("error on request twitter auth token: \(error)")
            }
        }
    }
    
    private func handleTwitterTokenStore(_ token: TwitterTokenResponse) {
        do {
            let tokenService = AccessTokenService(keychainService: KeychainService(service: ProjectUtils.keychainGroupName()))
            let accessToken = AccessToken(tokenType: .other, accessToken: token.accessToken ?? "", scope: nil, refreshToken: nil)
            try tokenService.saveAccessToken(accessToken)
        } catch {
            self.errorObservable.onNext(error)
            print("error on store token: \(error.localizedDescription)")
        }
    }
}
