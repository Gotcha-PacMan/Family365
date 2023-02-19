//
//  RegisterView.swift
//  Family365
//
//  Created by Warat T on 2023-02-01.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct RegisterView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @State var shouldShowImagePicker = false

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
                        shouldShowImagePicker.toggle()
                    } label: {
                        
                        VStack {
                            
                            if let image = self.image {
                                //Picked Image
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .scaledToFill()
                                    .cornerRadius(90)
                            } else {
                                // Default
                                Image(systemName: "person.fill")
                                    .font(.system(size: 64))
                                    .padding()
                                    .foregroundColor(Color.black)
                            }
                            
                        } // End VStack
                        .overlay(RoundedRectangle(cornerRadius: 65)
                                    .stroke(Color.gray, lineWidth: 2))
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
                
                .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
                    ImagePicker(image: $image)
                }
                
                Text(self.statusMessage)
                    .foregroundColor(.red)
                
            } // End ZStack
            
        } // End Scrollview
        
    }
    
    @State var image: UIImage?
    
    @State var statusMessage = ""
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
              if let error = error {
                  print("Failed to create user:", error)
                  self.statusMessage = "Failed to create user: \(error)"
                  return
              }
              
              print("Successfully created \(result?.user.uid ?? "")")
              
              self.statusMessage = "Successfully created \(result?.user.uid ?? "")"
            
            self.persistImageToStorage()
            
          }
      }
        
    private func persistImageToStorage() {
//       let filename = UUID().uuidString
        guard let uid = Auth.auth().currentUser?.uid
        else { return }
        let ref = Storage.storage().reference(withPath: uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) {
            metadata, error in if let error = error {
                self.statusMessage = "Failed to push up image: \(error)"
                return
            }
            
            ref.downloadURL { url, error in
                if let error = error {
                    self.statusMessage = "Failed to retrieve: \(error)"
                    return
                }
                
                self.statusMessage = "Sucessfully Stored Image: \(url?.absoluteString ?? "")"
                
                guard let url = url else { return }
                self.storeUserInformation(imageProfileUrl: url)
                
            }
            
        }
    }
    
    private func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userData = ["email": self.email, "uid": uid, "profileImageURL": imageProfileUrl.absoluteString]
        Firestore.firestore().collection("Users")
            .document(uid).setData(userData) {
                error in if let error = error {
                    print (error)
                    self.statusMessage = "\(error)"
                    return
                }
                print("Success!!!")
            }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
