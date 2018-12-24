//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation
import RequestLoanDomain
import Moya

public enum Target: TargetType {
  case login(username: String, password: String)
  case requestLoan(form: RequestLoanForm)
  
  public var baseURL: URL {
    return URL(string: "http://smartloandev.tcrbank.com:2222")!
  }
  public var path: String {
    switch self {
    case .login(_, _): return "/Login"
    case .requestLoan(let form): return "/request-loan"
    }
  }
  public var method: Moya.Method {
    switch self {
    case .login(_, _): return .post
    case .requestLoan(_): return .post
    }
  }
  public var sampleData: Data { return Data() }
  public var task: Task {
    switch self {
    case let .login(username, password): return .requestJSONEncodable(Credential(username: username, password: password))
    case .requestLoan(_): return .requestPlain
    }
  }
  public var headers: [String: String]? {
    switch self {
    case .login: return ["Content-Type": "application/json",
                         "Accept": "application/json",
                         "DeviceToken": "00:00:00:00:00"]
    case .requestLoan: return [:]
    }
  }
}