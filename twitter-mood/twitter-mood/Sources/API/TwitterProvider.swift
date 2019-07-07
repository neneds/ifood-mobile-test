//
//  TwitterProvider.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/6/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Moya

enum TwitterProvider {
    case fetchTweets(username: String, count: Int)
    case authorize
}

extension TwitterProvider: TargetType {
    var baseURL: URL {
        return NetworkManager.shared.currentBaseURL()
    }
    
    var path: String {
        switch self {
        case .fetchTweets(username: _, count: _):
            return "/1.1/statuses/user_timeline.json"
        case .authorize:
            return "oauth2/token"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchTweets(username: _, count: _):
            return .get
        case .authorize:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .fetchTweets(username: _, count: _):
            return Data()
        case .authorize:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .fetchTweets(let username, let count):
            let parameters = ["screen_name": username, "count": count] as [String : Any]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .authorize:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}



