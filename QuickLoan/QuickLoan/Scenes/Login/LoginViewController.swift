//
// Created by Arnon Keereena on 23/12/2018 AD.
// Copyright (c) 2018 myste1tainn. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RequestLoanNetworkPlatform

class LoginViewController: UIViewController {
  
  let disposeBag = DisposeBag()
  var viewModel: ViewModel!
  
  @IBOutlet weak var usernameTextField: UITextField?
  @IBOutlet weak var passwordTextField: UITextField?
  @IBOutlet weak var submitButton: UIButton?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    rxBinding()
  }
  
  private func ensureViewModel() {
    guard viewModel == nil else { return }
    let provider = UseCaseProvider()
    let useCase = provider.makeRequestLoanUseCase()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let navigator = DefaultLoginNavigator(provider: provider, sourceViewController: self, storyboard: storyboard)
    viewModel = ViewModel(useCase: useCase, navigator: navigator)
  }
  
  private func rxBinding() {
    ensureViewModel()
    guard let username = usernameTextField?.rx.text.filter({ $0 != nil }).map({ $0! }),
          let password = passwordTextField?.rx.text.filter({ $0 != nil }).map({ $0! }),
          let trigger = submitButton?.rx.tap else {
      return
    }
    
    let output = viewModel.transform(input: .init(username: username.asDriver(onErrorJustReturn: ""),
                                                  password: password.asDriver(onErrorJustReturn: ""),
                                                  trigger: trigger.asDriver(onErrorJustReturn: ())))
    
    output.loggedIn.drive().disposed(by: disposeBag)
  }
  
}