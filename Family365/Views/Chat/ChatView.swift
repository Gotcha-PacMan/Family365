//
//  ChatView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Text("Custom Nav")
                
                ScrollView{
                    ForEach(0..<10, id: \.self) { num in
                        VStack {
                            HStack (spacing: 15){
                                Image(systemName: "person.fill")
                                    .font(.system(size: 32))
                                Text("User Profile Image")
                                VStack(alignment: .leading) {
                                    Text("Username")
                                        .font(.system(size: 16, weight: .bold))
                                    Text("Message sent to user")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.gray)
                                }
                                Spacer()
                                
                                Text("22d")
                                    .font(.system(size: 14, weight: .semibold))
                                
                            } // End ZStack
                            Divider()
                            
                        } // End VStack
                        .padding(.horizontal)
                    }
                
                } // End Scrollview
    
            } // End VStack
           // .navigationTitle("Main Message")
                
        } // End NavigationView
        
    }
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
