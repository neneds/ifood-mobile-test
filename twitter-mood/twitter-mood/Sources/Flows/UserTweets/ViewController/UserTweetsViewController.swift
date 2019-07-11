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
        registerNibs()
        setupTableView()
        bindViewModel()
    }
    
    override func setViewModel(viewModel: Any) {
        guard let viewModel = viewModel as? UserTweetsViewModel else {
            fatalError("viewmodel of unexpected type")
        }
        self.viewModel = viewModel
        viewModel.loadUserTweets(username: viewModel.username)
    }
    
    func bindViewModel() {
        self.title = viewModel.username
        
        viewModel.isLoading.asDriver(onErrorJustReturn: false).drive(onNext: { [weak self] (isLoading) in
            isLoading ? self?.view.lockView() : self?.view.unlockView()
        }).disposed(by: disposeBag)
        
        viewModel.userTweets
            .bind(to: tableView.rx.items(cellIdentifier: TweetTableViewCell.typeName,cellType: TweetTableViewCell.self)) { [weak self] (_, element, cell) in
                cell.viewModel = element
            }.disposed(by: disposeBag)
    }
    
    private func registerNibs() {
        tableView.register(cellType: TweetTableViewCell.self)
    }
    
    private func setupTableView() {
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        tableView.tableFooterView = nil
        tableView.backgroundColor = UIColor.clear
    }
}

extension UserTweetsViewController: UITableViewDelegate {
    
}
