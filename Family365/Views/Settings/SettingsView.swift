//
//  SettingsView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    
    @State private var isDarkMode = false
    
    var body: some View {
            
        NavigationView {
            VStack {
                // Theme Changer
                VStack {
                    
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                    .padding()
                    Spacer()
                    
                }
                .background(isDarkMode ? Color.black : Color.white)
                .preferredColorScheme(isDarkMode ? .dark : .light)
                
                // Logout - button
                ZStack {
                    Button(action: logoutCurrentUser) {
                        Text("Logout")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray)
                            .cornerRadius(20.0)
                    } //
                
                    .frame(width: 310, height: 60, alignment: .center)
                    .padding()
                    Spacer()
                    
                } //End ZStack
                
            } // End VStack
                
        } // End NavView
        
    }
    
    func logoutCurrentUser() {
        
       // let firebaseAuth = Auth.auth()
        
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
