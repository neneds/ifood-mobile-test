//
//  TweetTableViewCell.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/8/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var imageViewProfile: UIImageView!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var textViewTweet: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
