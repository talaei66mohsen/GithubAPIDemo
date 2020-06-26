//
//  ResponseModel.swift
//  MyProject
//
//  Created by Mohsen on 6/25/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation

 struct UsersListResponse: Codable {
     let total_count        : Int?
     let incomplete_results : Bool?
     let items              : [UserModel]
 }
 
