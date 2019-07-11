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
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadMoodFromTweet(viewModel.tweetCellViewModel.tweetContent)
    }
    
    func bindViewModel() {
        viewModel.isLoading.asDriver(onErrorJustReturn: false).drive(onNext: { [weak self] (isLoading) in
            isLoading ? self?.view.lockView() : self?.view.unlockView()
        }).disposed(by: disposeBag)
        
        viewModel.errorObservable.asObservable()
            .filter({ $0 != nil })
            .subscribe(onNext: { [weak self] (error) in
                let okAction: AlertAction = (title: BaseLocalizable.okTitle, style:.default, handler:({ self?.dismiss(animated: true, completion: nil) }))
                self?.showRequestErrorAlert(error, actions: [okAction])
            }).disposed(by: disposeBag)
    }
    
    private func resetViewState() {
        labelMoodName.text = ""
        labelMood.text = "🤔"
        labelMoodTitle.text = "Mood"
        viewMoodBg.backgroundColor = UIColor.clear
        textViewTweet.text = BaseLocalizable.emptyTitleDefault
    }
}
