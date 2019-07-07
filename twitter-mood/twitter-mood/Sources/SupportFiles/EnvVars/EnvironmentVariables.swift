//
//  EnvironmentVariables.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import Foundation

final class EnvironmentVariables: Codable {
    let apiVariablesTwitter: APIEnvironmentVariables?
    let apiVariablesGoogle: APIEnvironmentVariables?
    
    init(apiVariablesTwitter: APIEnvironmentVariables?, apiVariablesGoogle: APIEnvironmentVariables?) {
        self.apiVariablesTwitter = apiVariablesTwitter
        self.apiVariablesGoogle = apiVariablesGoogle
    }
}

class APIEnvironmentVariables: Codable {
    let domain: String?
    let apiVersion: String?
    let apiKey: String?
    
    var baseURL: URL? {
        guard var domain = domain else { return nil }
        if let unwrappedAPIVersion = apiVersion {
            domain.append("/\(unwrappedAPIVersion)")
        }
        return URL(string: domain)
    }
    
    init(domain: String?, apiVersion: String?, apiKey: String?) {
        self.domain = domain
        self.apiVersion = apiVersion
        self.apiKey = apiKey
    }
}
