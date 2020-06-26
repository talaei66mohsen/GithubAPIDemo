//
//  Webservice.swift
//  MyProject
//
//  Created by Mohsen on 6/26/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation

 class Webservice {
     
     func getUserList(url: URL, completion: @escaping ([UserModel]?) -> ()) {
         URLSession.shared.dataTask(with: url) { data, response, error in
             guard let data = data, error == nil else {
                 completion(nil)
                 return
             }
             let response = try? JSONDecoder().decode(UsersListResponse.self, from: data)
             if let response = response {
                 DispatchQueue.main.async {
                     completion(response.items)
                 }
             }
         }.resume()
     }
    
    func getRepoList(url: URL, completion: @escaping ([RepoModel]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let response = try? JSONDecoder().decode(Array<RepoModel>.self, from: data)
            if let response = response {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
        }.resume()
    }
 }
 
