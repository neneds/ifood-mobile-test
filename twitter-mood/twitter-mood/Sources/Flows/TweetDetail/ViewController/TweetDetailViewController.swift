//
//  TweetDetailViewController.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    @IBOutlet private weak var labelMoodName: UILabel!
    @IBOutlet private weak var labelMood: UILabel!
    @IBOutlet private weak var viewMoodBg: UIView!
    @IBOutlet private weak var labelMoodTitle: UILabel!
    @IBOutlet private weak var textViewTweet: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
