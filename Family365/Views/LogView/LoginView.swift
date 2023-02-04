//
//  ContentView.swift
//  Family365
//
//  Created by Warat T on 2023-01-30.
//

import SwiftUI
import Firebase

struct loginView: View {
    
    // Propeties
    @State private var email = ""
    @State private var password = ""
    @State private var showDetail: Bool = false
    @State private var userIsLoggedIn = false
    
    struct CustomColor {
        static let myColor = Color("backLogin")
    }
    
    var body: some View {
        if userIsLoggedIn {
            //Go to next view
            //Test
            NavigationView()
        } else {
            signInView
        }
    }
    
    var signInView: some View {
        
     //   NavigationView {
            
        // Scrollwheel
        ScrollView (showsIndicators: false){
            
        // The overlayView
        ZStack {
            
            // BackgroundBox
            Rectangle()
                .fill(Color.white)
                .shadow(radius: 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 10)
                
                // The verticalView
                VStack(alignment: .center, spacing : 0 ) {
            
                    // App Image
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                    Text("Family365")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                    Text("Login")
                        .font(.title).foregroundColor(.black)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                        // Mail Image
                        Image("logicon")
                            .frame(maxWidth: 350, maxHeight: .infinity, alignment: .leading)
                            .listRowInsets(EdgeInsets())
                        
                        TextField("Email", text: self.$email)
                            .padding()
                            .autocapitalization(.none)
                            .keyboardType(.default)
                            .frame(width: 350, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 2)
                                    .frame(width: 350, height: 60)
                            )
                            .padding(.bottom, 10)

                        // Password Image
                        Image("passLock")
                            .frame(maxWidth: 350, maxHeight: .infinity, alignment: .leading)
                            .listRowInsets(EdgeInsets())
                        
                        SecureField("Password", text: self.$password)
                            .padding()
                            .frame(width: 350, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.black, lineWidth: 2)
                                    .frame(width: 350, height: 60)
                                )
                
                // Sign in - button
                Button(action: {login()}) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(.gray)
                        .cornerRadius(20.0)
                }
                // Customize sign in button, here!
                .frame(width: 310, height: 60, alignment: .center)
                .padding(.top, 45)
                    
                    // Sign in - button
                    Button(action: {register()}) {
                        Text("Register Account")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(.gray)
                            .cornerRadius(20.0)
                    }
                    // Customize register button, here!
                    .frame(width: 310, height: 60, alignment: .center)
                    .padding(.top, 45)
               
                }
                //End VStack, here!
                .padding (.bottom, 45)
            
                .onAppear(){
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            userIsLoggedIn.toggle()
                        }
                    }
                }
                    
         }
            
                //End ZStack, here!
        .padding([ .top,.bottom ], 70)
  
        }
            
            //End scrollwheel, here!
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.all)
       }
            //End NavigationView, here!
       // .ignoresSafeArea()
  //  }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Other phonemodels can be put here as well
        loginView()
            .previewInterfaceOrientation(.portrait)
        
        // Screen I am focusing on, Iphone 13
        loginView()
            .previewLayout(.fixed(width: 390, height: 844))
        
      
    }
}
