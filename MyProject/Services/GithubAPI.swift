//
//  Webservice.swift
//  MyProject
//
//  Created by Mohsen on 6/26/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation
import Combine

enum GithubAPI {
    
    static func getUserList() -> AnyPublisher<UsersListResponse, ResponseError> {
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)
        
        let endPoint = EndPoint.usersList
        let urlRequest = URL(string :endPoint.baseURL.absoluteString + endPoint.path)!
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { response -> Data in
                guard
                    let httpURLResponse = response.response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200
                    else {
                        throw ResponseError.statusCode
                }
                return response.data
        }
        .decode(type: UsersListResponse.self, decoder: JSONDecoder())
        .mapError { ResponseError.map($0) }
        .eraseToAnyPublisher()
    }
    
    static func getRepoList(name: String) -> AnyPublisher<[RepoModel], ResponseError> {
        let endPoint = EndPoint.repos(name: name)
        let url = URL(string: endPoint.baseURL.absoluteString + endPoint.path)!
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)
        
        let urlRequest = URLRequest(url: url)
        
        return session.dataTaskPublisher(for: urlRequest)
            .tryMap { response -> Data in
                guard
                    let httpURLResponse = response.response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200
                    else {
                        throw ResponseError.statusCode
                }
                return response.data
        }
        .decode(type: [RepoModel].self, decoder: JSONDecoder())
        .mapError { ResponseError.map($0) }
        .eraseToAnyPublisher()
    }
    
}
