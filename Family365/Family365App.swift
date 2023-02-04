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
    
    var body: some Scene {
        WindowGroup {
            loginView()
        }
    }
}
