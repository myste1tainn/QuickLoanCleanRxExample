//
// Created by Arnon Keereena on 23/12/2018 AD.
// Copyright (c) 2018 myste1tainn. All rights reserved.
//

import Foundation

protocol ViewModelType {
  associatedtype Input
  associatedtype Output
  
  func transform(input: Input) -> Output
}

