//
//  EndPoint.swift
//  TheMovieDB
//
//  Created by Mohsen on 2019-05-30.
//  Copyright © 2019 Mohsen. All rights reserved.
//

import Foundation

protocol EndPointSpecs {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod:String { get }
}

enum EndPoint{
    case usersList
    case repos(name: String)
}

extension EndPoint: EndPointSpecs{
    var baseURL: URL{
        return URL.init(string: "https://api.github.com")!
    }
    
    var path: String{
        switch self {
        case .usersList:
            return "/search/users?q=location:iran+language:swift&page=1&per_page=100"
        case .repos(let name):
            return "/users/\(name)/repos"
        }
    }
    
    var httpMethod: String{
        return "get"
        //Switch case is needed for more than one endpoints
    }
    
}
