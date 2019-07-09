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
    private var userLookupViewController: TwitterUserLookupViewController!
    private var navigationController: UINavigationController?
    
    
    override init(window: UIWindow?, parentCoordinator: BaseCoordinator?) {
        super.init(window: window, parentCoordinator: parentCoordinator)
        guard let window = window else {
            fatalError("No UIWindow!")
        }
        self.window = window
    }
    
    override func start() {
        userLookupViewController = TwitterUserLookupViewController(viewModel: TwitterUserLookupViewModel(), nibName: "TwitterUserLookupViewController")
        navigationController = UINavigationController(rootViewController: userLookupViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
    }
}
