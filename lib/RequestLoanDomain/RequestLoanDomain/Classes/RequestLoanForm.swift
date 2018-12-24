//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation

public struct RequestLoanForm {
  public var personalDetails: PersonalDetails
  public var paymentDetails: PaymentDetails?
  public var loanType: LoanType
  
  public init() {
    self.personalDetails = .init()
    self.paymentDetails = nil
    self.loanType = .quick
  }
}

public struct PersonalDetails {

}

public struct PaymentDetails {

}

public enum LoanType: String {
  case quick = "QUICK_LOAN"
  case makro = "MAKRO_LOAN"
}