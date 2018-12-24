//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation
import RxSwift
import Moya
import RequestLoanDomain
import RequestLoanNetwork

final class RequestLoanUseCase: RequestLoanDomain.RequestLoanUseCase {
  
  let provider: Provider
  
  init(provider: Provider) {
    self.provider = provider
  }
  
  func login(username: String, password: String) -> Single<LoginResponse> {
    return provider.rx
      .request(.login(username: username, password: password))
      .map { try $0.asDomainModel(LoginResponse.self) }
  }
  
  func requestLoan(form: RequestLoanForm) -> Single<Void> {
    return provider.rx
      .request(.requestLoan(form: form))
      .map { _ in }
  }
}

