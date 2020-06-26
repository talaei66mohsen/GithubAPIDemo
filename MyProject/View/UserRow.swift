//
//  UserListCell.swift
//  MyProject
//
//  Created by Mohsen on 6/26/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct UserRow : View {
    
    let user: UserViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("User Name : ")
                    .font(.custom("IRANSansFaNum-Light", size: 22.0))
                Text(user.login)
                    .font(.system(size: 22.0)).bold()
            }
            
            Text("Score : \(Int(user.score))")
                .font(.custom("IRANSansFaNum-Light", size: 15.0))
                .foregroundColor(.gray)
        }
    }
}
