//
// Created by Arnon Keereena on 23/12/2018 AD.
//

import Foundation
import ObjectMapper

public struct LoginResponse: Mappable {
//  public enum Keys: String, CodingKey {
//    case adUser = "ADUser"
//    case empCode = "EmpCode"
//    case nameEmp = "NameEmp"
//    case nameEmpEN = "NameEmpEN"
//    case branchCode = "BranchCode"
//    case branchName = "BranchName"
//    case tel = "Tel"
//    case token = "Token"
//    case authenDescription = "AuthenDescription"
//  }
  
  var adUser: String?
  var empCode: String?
  var nameEmp: String?
  var nameEmpEN: String?
  var branchCode: String?
  var branchName: String?
  var tel: String?
  var token: String?
  var authenDescription: String?
  
  public init?(map: Map) {
  
  }
  
  public mutating func mapping(map: Map) {
    adUser <- map["ADUser"]
    empCode <- map["EmpCode"]
    nameEmp <- map["NameEmp"]
    nameEmpEN <- map["NameEmpEN"]
    branchCode <- map["BranchCode"]
    branchName <- map["BranchName"]
    tel <- map["Tel"]
    token <- map["Token"]
    authenDescription <- map["AuthenDescription"]
  }
}
