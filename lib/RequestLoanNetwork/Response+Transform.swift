//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation
import Moya

extension Response {
  public func asDomainModel<T: Codable>(_ type: T.Type) throws -> T {
    let decoder = JSONDecoder()
    return try decoder.decode(type, from: data)
  }
}
