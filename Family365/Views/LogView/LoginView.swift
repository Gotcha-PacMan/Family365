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
    @State private var isPresented = false
    @State var statusMessage = ""
    
    //Custom Color
    struct CustomColor {
        static let myColor = Color("backLogin")
    }
    
    var body: some View {
            
            if userIsLoggedIn {
                //If user is logged in, go to next view
                NavBar()
            } else {
                //If not stay on the same view
                signInView
            }
        
        }
    
    var signInView: some View {
            
    NavigationView {
        
    // Scrollwheel
    ScrollView (showsIndicators: false){
            
        // The overlayView
        ZStack {
            
            // Simple background
            Rectangle()
                .fill(Color.white)
                .shadow(radius: 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // The verticalView
                VStack(alignment: .center, spacing : 0 ) {
            
                    // App Icon, title and viewTitle
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
                    
                    
                        // Mail
                        Image("logicon")
                            .frame(maxWidth: 350, maxHeight: .infinity, alignment: .leading)
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
            
                        // Login - button
                        Button(action: {login()}) {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 300, height: 50)
                                .background(.gray)
                                .cornerRadius(20.0)
                        }
                        .frame(width: 310, height: 60, alignment: .center)
                        .padding(.top, 40)
                            
                            // Register - button
                            Button("Register Account") {
                                self.isPresented.toggle()
                            }
                            .fullScreenCover(isPresented: $isPresented, content: RegisterView.init)
                    
                            .frame(width: 310, height: 60, alignment: .center)
                            .padding()
            
                } //End VStack here!
                       
                //Look if user is logged in and trigger userIsLoggedIn
                //if the user are logged in
            
                .onAppear(){
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            userIsLoggedIn.toggle()
                        }
                    }
                } 
            
         } //End ZStack, here!
            
        } //End scrollwheel
        .ignoresSafeArea()
       
       } //End NavigationVieW
       .navigationBarHidden(true)

    }
    
    // login with auth.firestore
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed login the user:", error)
                self.statusMessage = "Failed login the user: \(error)"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.statusMessage = "Successfully logged in \(result?.user.uid ?? "")"
            
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
             
        
      
    }
}
