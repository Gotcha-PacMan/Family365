//
//  SettingsView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    
    
    
    var body: some View {
        
        ZStack {
            
            
            
            // Logout - button
            Button(action: {logoutCurrentUser()}) {
                Text("Logout")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.gray)
                    .cornerRadius(20.0)
            }
        
            .frame(width: 310, height: 60, alignment: .center)
            .padding(.top, 20)
            
            
        } //End ZStack
        
        
    }
    
    func logoutCurrentUser() {
        
      /*  let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        } */
        
        do { try Auth.auth().signOut() }
            catch { print("already logged out") } 
        
        }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
