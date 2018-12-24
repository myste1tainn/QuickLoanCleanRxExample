//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation
import RxSwift

public protocol RequestLoanUseCase {
  func login(username: String, password: String) -> Single<LoginResponse>
  func requestLoan(form: RequestLoanForm) -> Single<Void>
}

