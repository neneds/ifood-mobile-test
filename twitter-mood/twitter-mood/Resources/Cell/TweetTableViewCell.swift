//
//  TweetTableViewCell.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/8/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell, CellIdentifiable, BindableType {
    
    internal var viewModel: UserTweetCellViewModel! {
        didSet {
            if viewModel != nil {
                bindViewModel()
            }
        }
    }
    
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var imageViewProfile: UIImageView!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var textViewTweet: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        resetToInitialStatus()
    }
    
    func bindViewModel() {
        labelName.text = viewModel.tweetUserName
        textViewTweet.text = viewModel.tweetContent
    }
    
    private func resetToInitialStatus() {
        labelName.text = "--"
        labelDate.text = ""
        textViewTweet.text = BaseLocalizable.emptyTitleDefault
        imageViewProfile.image = UIImage(named: "user-placeholder")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetToInitialStatus()
    }
}
