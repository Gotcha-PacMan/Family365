//
//  ContentView.swift
//  Family365
//
//  Created by Warat T on 2023-01-30.
//

import SwiftUI


struct loginView: View {
    
    // Propeties
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        // The View
        VStack(spacing : 2) {
            
            // App Image
            Image("icon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("Family365")
                .font(.largeTitle)
            
            // Title login
            Text("Login")
                .font(.title).foregroundColor(.black)
                .padding([.top, .bottom], 40)
            
            // Input textfield for login
            TextField("Email", text: self.$email)
                .padding()
                .frame(width: 350, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 350, height: 60)
                )
            
            SecureField("Password", text: self.$password)
                .padding()
                .frame(width: 350, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 2)
                        .frame(width: 350, height: 60)
                )
            
                .padding(.top, 25)
            
            // Sign in - button
            Button(action: {}) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.gray)
                    .cornerRadius(20.0)
            }
            .padding(.top, 50)
                        
            
        }
    
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Other phonemodels
        loginView()
            .previewInterfaceOrientation(.portrait)
        
        // Screen I am focusing on, Iphone 13
        loginView()
            .previewLayout(.fixed(width: 390, height: 844))
        
      
    }
}
