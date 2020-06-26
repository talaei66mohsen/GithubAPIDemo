//
//  RepoListViewModel.swift
//  MyProject
//
//  Created by Mohsen on 6/27/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class RepoListViewModel: ObservableObject {
    
    init() {
        
    }
    
    @Published var isLoading = false
    @Published var repos = [RepoViewModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func fetchData(name:String) {
        _ = GithubAPI.getRepoList(name: name)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] completion in
                self.isLoading = false
                switch completion {
                case .finished: break
                case .failure(let error):
                    print("Error: \(error)")
                }
                }, receiveValue: { [unowned self] repos in
                    self.repos  = repos.map(RepoViewModel.init)
            })
    }
    
    let didChange = PassthroughSubject<RepoListViewModel,Never>()
}
