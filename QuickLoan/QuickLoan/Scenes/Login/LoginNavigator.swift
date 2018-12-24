//
// Created by Arnon Keereena on 23/12/2018 AD.
// Copyright (c) 2018 myste1tainn. All rights reserved.
//

import Foundation
import UIKit
import RequestLoanDomain

protocol LoginNavigator {
  func toRequestLoan(response: LoginResponse)
  func alert(error: Error)
}

class DefaultLoginNavigator: LoginNavigator {
  private let storyboard: UIStoryboard
  private let sourceViewController: UIViewController
  private let provider: UseCaseProvider
  
  init(provider: UseCaseProvider,
       sourceViewController: UIViewController,
       storyboard: UIStoryboard) {
    self.provider = provider
    self.sourceViewController = sourceViewController
    self.storyboard = storyboard
  }
  
  func toRequestLoan(response: LoginResponse) {
    let viewController = storyboard.instantiateViewController(withIdentifier: "RequestLoanViewController") as! RequestLoanViewController
    let useCase = provider.makeRequestLoanUseCase()
    let navigator = DefaultRequestLoanNavigator(provider: provider,
                                                sourceViewController: sourceViewController,
                                                storyboard: storyboard)
    viewController.viewModel = RequestLoanViewController.ViewModel(useCase: useCase,
                                                                   navigator: navigator,
                                                                   loginResponse: response)
    sourceViewController.navigationController?.pushViewController(viewController, animated: true)
  }
  
  func alert(error: Error) {
    let alertViewController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
    alertViewController.addAction(.init(title: "OK", style: .cancel))
    sourceViewController.present(alertViewController, animated: true)
  }
}