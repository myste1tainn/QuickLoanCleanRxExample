import Foundation
import RequestLoanDomain
import RequestLoanNetwork
import RxSwift

public class UseCaseProvider: RequestLoanDomain.UseCaseProvider {
  
  public init() {}
  
  public func makeRequestLoanUseCase() -> RequestLoanDomain.RequestLoanUseCase {
    return RequestLoanUseCase(provider: Provider())
  }
}
