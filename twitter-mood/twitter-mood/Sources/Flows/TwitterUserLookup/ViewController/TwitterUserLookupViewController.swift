//
//  TwitterUserLookupViewController.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

class TwitterUserLookupViewController: BaseViewController {
    
    @IBOutlet private weak var labelTwitterUserTitle: UILabel!
    @IBOutlet private weak var textFieldInput: UITextField!
    @IBOutlet private weak var buttonSeeTweets: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func setLocalizations() {
        labelTwitterUserTitle.text = TwitterUserLookupLocalizable.twitterUser
        buttonSeeTweets.setTitle(TwitterUserLookupLocalizable.seeTweets, for: .normal)
        textFieldInput.placeholder = TwitterUserLookupLocalizable.twitterUserName
        
    }

}
