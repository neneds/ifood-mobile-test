//
//  TwitterUserLookupViewController.swift
//  twitter-mood
//
//  Created by Dennis Merli on 7/7/19.
//  Copyright © 2019 Dennis Merli. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TwitterUserLookupViewController: BaseViewController, BindableType {

    @IBOutlet private weak var labelTwitterUserTitle: UILabel!
    @IBOutlet private weak var textFieldInput: UITextField!
    @IBOutlet private weak var buttonSeeTweets: UIButton!
    
    internal var viewModel: TwitterUserLookupViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func setViewModel(viewModel: Any) {
        guard let viewModel = viewModel as? TwitterUserLookupViewModel else {
            fatalError("viewmodel of unexpected type")
        }
        self.viewModel = viewModel
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.checkForAuthentication()
    }
    
    override func setLocalizations() {
        labelTwitterUserTitle.text = TwitterUserLookupLocalizable.twitterUser
        buttonSeeTweets.setTitle(TwitterUserLookupLocalizable.seeTweets, for: .normal)
        textFieldInput.placeholder = TwitterUserLookupLocalizable.twitterUserName
    }
    
    func bindViewModel() {
        textFieldInput.rx.text
            .orEmpty
            .map({ $0.trimmingCharacters(in: .whitespaces) })
            .bind(to: viewModel.userNameInput)
            .disposed(by: disposeBag)
        
        viewModel.isLoading.asObservable().subscribe(onNext: { [weak self] (isLoading) in
            isLoading ? self?.view.lockView() : self?.view.unlockView()
        }).disposed(by: disposeBag)
        
        viewModel.userNameValidated.asObservable().subscribe(onNext: { [weak self] (isEnabled) in
            self?.buttonSeeTweets.isEnabled = isEnabled
        }).disposed(by: disposeBag)
    }

}
