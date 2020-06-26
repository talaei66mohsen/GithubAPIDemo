//
//  ResponseError.swift
//  MyProject
//
//  Created by Mohsen on 6/26/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation

enum ResponseError: Error {
  case statusCode
  case decoding
  case other(Error)
  
  static func map(_ error: Error) -> ResponseError {
    return (error as? ResponseError) ?? .other(error)
  }
}
