//
//  RegisterView.swift
//  Family365
//
//  Created by Warat T on 2023-02-01.
//

import SwiftUI
import Firebase

struct RegisterView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    class FirebaseManager: NSObject {
        static let shared = FirebaseManager()
        let auth: Auth
        
        override init() {
            FirebaseApp.configure()
            self.auth = Auth.auth()
            super.init()
        }
    }
    
    var body: some View {
      
        ScrollView (showsIndicators: false) {
        
            ZStack {
                
                // Simple background
                Rectangle()
                    .fill(Color.white)
                    .shadow(radius: 50)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, 10)
                
                VStack (alignment: .center, spacing : 0 ) {
                    
                    Text("Register Account")
                        .font(.title).foregroundColor(.black)
                        .padding(.top, 30)
                        .padding(.bottom, 20)
                    
                    //Account Image
                    Button {
                        
                    } label: {
                        Image(systemName: "person.fill")
                            .font(.system(size: 64))
                            .padding()
                    }
                    
                    .padding(.top, 20)
                    .padding(.bottom, 20)

                    // Mail
                    Image("logicon")
                        .frame(maxWidth: 350, maxHeight: 50, alignment: .leading)
                        .listRowInsets(EdgeInsets())
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .autocapitalization(.none)
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                        .frame(width: 350, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 2)
                                .frame(width: 350, height: 60)
                            )
                        .padding(.bottom, 10)
                    
                    // Password
                    Image("passLock")
                        .frame(maxWidth: 350, maxHeight: 50, alignment: .leading)
                        .listRowInsets(EdgeInsets())
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .frame(width: 350, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(.black, lineWidth: 2)
                                .frame(width: 350, height: 60)
                            )
                    
                    Button(action: {register()}) {
                        Text("Register Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray)
                            .cornerRadius(20.0)
                    }
                    .frame(width: 310, height: 60, alignment: .center)
                    .padding(.top, 40)
                    
                } // End VStack
                .padding (.bottom, 60)
                
                Text(self.statusMessage)
                    .foregroundColor(.red)
                
            } // End ZStack
            
        } // End Scrollview
        
        
    }
    
    @State var statusMessage = ""
    
    func register() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
              if let error = error {
                  print("Failed to create user:", error)
                  self.statusMessage = "Failed to create user: \(error)"
                  return
              }
              
              print("Successfully created \(result?.user.uid ?? "")")
              
              self.statusMessage = "Successfully created \(result?.user.uid ?? "")"
              
          }
      }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
