//
// Created by Arnon Keereena on 23/12/2018 AD.
// Copyright (c) 2018 myste1tainn. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RequestLoanDomain

extension LoginViewController {
  final class ViewModel: ViewModelType {
    struct Input {
      var username: Driver<String>
      var password: Driver<String>
      var trigger: Driver<Void>
    }
    
    struct Output {
      var loggedIn: Driver<Void>
    }
    
    var useCase: RequestLoanUseCase
    var navigator: LoginNavigator
    
    init(useCase: RequestLoanUseCase,
         navigator: LoginNavigator) {
      self.useCase = useCase
      self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
      let loggedIn = Driver.combineLatest(
        input.username.debug(),
        input.password.debug()
      ).flatMapLatest { tuple in
        input.trigger.debug().map { (tuple.0, tuple.1) }
      }.flatMap {
        self.useCase.login(username: $0.0, password: $0.1)
                    .do(onNext: { response in
                      self.navigator.toRequestLoan(response: response)
                    }, onError: {
                      self.navigator.alert(error: $0)
                    })
                    .map { _ in }
                    .asDriver(onErrorJustReturn: ())
      }
      return Output(
        loggedIn: loggedIn
      )
    }
  }
}
