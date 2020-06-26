//
//  RepoModel.swift
//  MyProject
//
//  Created by Mohsen on 6/27/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation

struct RepoModel : Codable {
    let name               : String?
    let node_id            : String?
    let full_name          : String?
    let id                 : Int?
}

class RepoViewModel: Identifiable {
    let id = UUID()
    let repo: RepoModel
    var name: String {
        return self.repo.name ?? ""
    }
    var full_name: String {
        return self.repo.full_name ?? ""
    }
    var node_id: String {
        return self.repo.node_id ?? ""
    }
    
    init(repo: RepoModel) {
        self.repo = repo
    }
    
}
