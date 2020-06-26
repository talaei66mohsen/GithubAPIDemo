//
//  RepoContentView.swift
//  MyProject
//
//  Created by Mohsen on 6/27/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation
import SwiftUI

struct RepoContentView: View {
    var name = String()
    @ObservedObject  var model = RepoListViewModel()
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Repository List").bold()
                .font(.custom("IRANSansFaNum-Bold", size: 25.0))
            List(model.repos) { repo in
                RepoRow(repo: repo)
            }
        }.onAppear() { self.model.fetchData(name: self.name) }
    }
}
