//
// Created by Arnon Keereena on 23/12/2018 AD.
// Copyright (c) 2018 myste1tainn. All rights reserved.
//

import Foundation
import RequestLoanDomain
import RxSwift
import RxCocoa

extension RequestLoanViewController {
  final class ViewModel: ViewModelType {
    struct Input {
      var submitTrigger: Driver<Void>
    }
    struct Output {
      var success: Driver<Void>
    }
    
    var useCase: RequestLoanUseCase
    var navigator: RequestLoanNavigator
    var loginResponse: LoginResponse
    
    init(useCase: RequestLoanUseCase,
         navigator: RequestLoanNavigator,
         loginResponse: LoginResponse) {
      self.useCase = useCase
      self.navigator = navigator
      self.loginResponse = loginResponse
    }
  
    func transform(input: Input) -> Output {
      let success = input.submitTrigger.flatMap { _ in
        self.useCase.requestLoan(form: .init()).asDriver(onErrorJustReturn: ())
      }.do(onNext: { _ in
        self.navigator.toSuccess()
      })
      return Output(
        success: success
      )
    }
  }
}

