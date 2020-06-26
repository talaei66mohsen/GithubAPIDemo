//
//  UserListViewModel.swift
//  MyProject
//
//  Created by Mohsen on 6/26/20.
//  Copyright © 2020 Mohsen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class UsersListViewModel: ObservableObject {
    init() {
        fetchData()
    }
    
    @Published var isLoading = true
    @Published var users = [UserViewModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func fetchData() {
        _ = GithubAPI.getUserList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] completion in
                self.isLoading = false
                switch completion {
                case .finished: break
                case .failure(let error):
                    print("Error: \(error)")
                }
                }, receiveValue: { [unowned self] usersListResponse in
                    self.users = usersListResponse.items.map(UserViewModel.init)
            })
    }
    
    let didChange = PassthroughSubject<UsersListViewModel,Never>()
}
