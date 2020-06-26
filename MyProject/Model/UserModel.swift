//
//  UserModel.swift
//  MyProject
//
//  Created by Mohsen on 6/25/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation

struct UserModel : Codable {
    
    let login               : String?
    let node_id             : String?
    let avatar_url          : String?
    let gravatar_id         : String?
    let url                 : String?
    let html_url            : String?
    let followers_url       : String?
    let following_url       : String?
    let gists_url           : String?
    let starred_url         : String?
    let subscriptions_url   : String?
    let organizations_url   : String?
    let repos_url           : String?
    let events_url          : String?
    let received_events_url : String?
    let type                : String?
    let id                  : Int?
    let site_admin          : Bool?
    let score               : Double?
}

class UserViewModel: Identifiable {
    let id = UUID()
    let user: UserModel
    var login: String {
        return self.user.login ?? ""
    }
    var score: Double {
        return self.user.score ?? 0.0
    }
    var following_url: String {
        return self.user.following_url ?? ""
    }
    var avatar_url: String {
        return self.user.avatar_url ?? ""
    }
    
    init(user: UserModel) {
        self.user = user
    }
}

