//
//  UserTweetsViewController.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/6/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit
import RxSwift

class UserTweetsViewController: BaseViewController, BindableType {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var labelUsername: UILabel!
    @IBOutlet private weak var imageViewUser: UIImageView!
    
    internal var viewModel: UserTweetsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func setViewModel(viewModel: Any) {
        guard let viewModel = viewModel as? UserTweetsViewModel else {
            fatalError("viewmodel of unexpected type")
        }
        self.viewModel = viewModel
    }
    
    func bindViewModel() {
        self.title = viewModel.username
    }

}
