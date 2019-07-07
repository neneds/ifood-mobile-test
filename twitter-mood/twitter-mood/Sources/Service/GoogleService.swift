//
//  GoogleService.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol GoogleServiceType {
    func moodForTweet(_ tweet: Tweet?) -> Single<String>
}

final class GoogleService: BaseNetworkService<GoogleProvider>, GoogleServiceType {
    
    func moodForTweet(_ tweet: Tweet?) -> Single<String> {
        guard let tweet = tweet else { return Single.error(CustomError.nilParameter(parameter: "Tweet"))}
        return provider.rx
            .request(.moodForTweet(tweet))
            .flatMap({ (response) -> Single<String> in
                do {
                    try _ = response.filterSuccessfulStatusCodes()
                    let tweets = try JSONDecoder().decode(String.self, from: response.data)
                    return Single.just("")
                } catch {
                    return Single.error(NetworkManager.shared.handleMoyaError(error, response: response))
                }
            })
    }
}

