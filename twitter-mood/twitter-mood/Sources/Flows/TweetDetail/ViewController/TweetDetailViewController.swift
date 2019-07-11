//
//  TweetDetailViewController.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

class TweetDetailViewController: BaseViewController, BindableType {

    @IBOutlet private weak var labelMoodName: UILabel!
    @IBOutlet private weak var labelMood: UILabel!
    @IBOutlet private weak var viewMoodBg: UIView!
    @IBOutlet private weak var labelMoodTitle: UILabel!
    @IBOutlet private weak var textViewTweet: UITextView!
    
    internal var viewModel: TweetDetailViewModel!
    
    override func setViewModel(viewModel: Any) {
        guard let viewModel = viewModel as? TweetDetailViewModel else {
            fatalError("viewmodel of unexpected type")
        }
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetViewState()
    }
    
    func bindViewModel() {
        
    }
    
    private func resetViewState() {
        labelMoodName.text = ""
        labelMood.text = "🤔"
        labelMoodTitle.text = "Mood"
        viewMoodBg.backgroundColor = UIColor.clear
        textViewTweet.text = BaseLocalizable.emptyTitleDefault
    }
}
