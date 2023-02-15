//
//  UserCheck.swift
//  Family365
//
//  Created by Warat T on 2023-02-15.
//

import Foundation

protocol UserService {
    func getUser() -> [Users]
}

final class UserServiceAdapter: UserService {
    static let shared = UserServiceAdapter()
    
    private lazy var users: [Users] = {
        return [
        
            Users(lat: 59.31440989130573, lon: 18.02090138937421, name: "Peter", address: "Lovholmsgränd", isOpen: false),
            Users(lat: 59.31440989130573, lon: 18.019113055619165, name: "Henke", address: "Lovholmsgränd", isOpen: false),
            Users(lat: 59.31311524572036, lon: 18.021942997829456, name: "Lisa", address: "Lovholmsgränd", isOpen: false),
            Users(lat: 59.31222358210498, lon: 18.02340216911398, name: "Paul", address: "Lovholmsgränd", isOpen: false),
            Users(lat: 59.3124592725995, lon: 18.02703479266922, name: "Fisk", address: "Lovholmsgränd", isOpen: true),
            Users(lat: 59.313811124004985, lon: 18.02819718209385, name: "Bjorn", address: "Lovholmsgränd", isOpen: false)
            
        ]
    }()
    
    private init() {}
    
    func getUser() -> [Users] {
        return users
    }
    
}
