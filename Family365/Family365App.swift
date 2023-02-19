//
//  Family365App.swift
//  Family365
//
//  Created by Warat T on 2023-01-30.
//

import SwiftUI
import Firebase


@main
struct Family365App: App {

    init() {
        FirebaseApp.configure()
    }
    
    /* class FirebaseManager: NSObject {
        static let shared = FirebaseManager()
        
        let auth: Auth
        
        override init() {
            FirebaseApp.configure()
            
            self.auth = Auth.auth()
            
            super.init()
        }
        
    } */
    
    
    var body: some Scene {
        WindowGroup {
            loginView()
        }
    }
}
