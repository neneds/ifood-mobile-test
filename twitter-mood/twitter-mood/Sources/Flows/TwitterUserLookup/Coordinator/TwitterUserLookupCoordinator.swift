//
//  TwitterUserLookupCoordinator.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

class TwitterUserLookupCoordinator: BaseCoordinator {
    
    private var window: UIWindow!
    var userLookupViewController: TwitterUserLookupViewController!
    
    override init(window: UIWindow?, parentCoordinator: BaseCoordinator?) {
        super.init(window: window, parentCoordinator: parentCoordinator)
        guard let window = window else {
            fatalError("No UIWindow!")
        }
        self.window = window
    }
    
    override func start() {
        userLookupViewController = TwitterUserLookupViewController(viewModel: TwitterUserLookupViewModel(), nibName: "TwitterUserLookupViewController")

        window.rootViewController = userLookupViewController
        window.makeKeyAndVisible()
        
    }
}
