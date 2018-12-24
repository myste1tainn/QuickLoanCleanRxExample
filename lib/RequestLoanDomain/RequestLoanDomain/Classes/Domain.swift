import Foundation

public protocol UseCaseProvider {
  func makeRequestLoanUseCase() -> RequestLoanUseCase
}