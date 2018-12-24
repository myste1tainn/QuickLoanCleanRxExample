//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation

public struct Credential: Codable {
  public enum Keys: String {
    case username = "Username"
    case password = "Password"
  }
  
  public var username: String?
  public var password: String?
  
  public init(username: String, password: String) {
    self.username = username
    self.password = password
  }
}