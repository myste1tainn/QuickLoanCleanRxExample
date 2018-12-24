//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation
import RequestLoanDomain
import ObjectMapper
import Moya

extension Response {
  public func asDomainModel<T: Mappable>(_ type: T.Type) throws -> T {
    let decoder = JSONDecoder()
    if statusCode > 299 {
      throw APIError(statusCode, message: String(data: data, encoding: .utf8) ?? "Unknown Error")
    } else if let string = String(data: data, encoding: .utf8),
              let object = T.init(JSONString: string) {
      return object
    } else {
      throw APIError(-1, message: "No body")
    }
  }
}

