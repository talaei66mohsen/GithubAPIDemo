//
//  UserContentView.swift
//  MyProject
//
//  Created by Mohsen on 6/25/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import SwiftUI

struct UserContentView: View {
    @ObservedObject var model = UsersListViewModel()
    var body: some View {
        return NavigationView {
            List(model.users) { user in
                NavigationLink(destination: RepoContentView.init(name: user.login))  {
                    UserRow(user: user)
                }
            }.navigationBarTitle("Select a user")
        }
    }
}
