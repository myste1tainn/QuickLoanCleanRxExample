//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation

public struct APIError: Error {
  public var code: Int
  public var message: String?
  
  public init(_ code: Int, message: String? = nil) {
    self.code = code
    self.message = message
  }
}