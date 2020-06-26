//
//  RepoRow.swift
//  MyProject
//
//  Created by Sepehr on 6/27/20.
//  Copyright © 2020 Sepehr. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct RepoRow : View {
    
    let repo: RepoViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Repository : ")
                    .font(.custom("IRANSansFaNum-Light", size: 22.0))
                Text(repo.name)
                    .font(.system(size: 22.0)).bold()
            }
        }
    }
}
