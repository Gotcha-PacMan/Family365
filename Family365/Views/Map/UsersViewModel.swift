//
//  UsersViewModel.swift
//  Family365
//
//  Created by Warat T on 2023-02-15.
//

import Foundation

final class UserViewModel {
    
    struct Dependencies {
        
        var userService: UserService = UserServiceAdapter.shared
        
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
    
    func getUser() -> [UsersAnnotationViewModel] {
        return dependencies.userService.getUser().map {
            UsersAnnotationViewModel(latitude: $0.lat , longtitude: $0.lon , name: $0.name , address: $0.address , isOpen: $0.isOpen)
        }
    }
    
}
