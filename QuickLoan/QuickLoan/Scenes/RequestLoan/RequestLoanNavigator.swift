//
// Created by Arnon Keereena on 23/12/2018 AD.
// Copyright (c) 2018 myste1tainn. All rights reserved.
//

import Foundation
import UIKit
import RequestLoanDomain

protocol RequestLoanNavigator {
  func toSuccess()
}

class DefaultRequestLoanNavigator: RequestLoanNavigator {
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
  
  func toSuccess() {
    let viewController = storyboard.instantiateViewController(withIdentifier: "SuccessViewController")
//    let useCase = provider.makeRequestLoanUseCase()
//    let navigator = DefaultSuccessNavigator()
//    viewController.viewModel = ViewModel(useCase: useCase, navigator: navigator)
    if let navController = sourceViewController.navigationController {
      navController.pushViewController(viewController, animated: true)
    } else {
      let navController = UINavigationController(rootViewController: viewController)
      sourceViewController.show(navController, sender: nil)
    }
  }
}