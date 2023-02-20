//
//  ChatView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI

struct ChatView: View {
    
    var body: some View {

       // VStack {
            // Bar with users profile and status
            HStack {
                Image(systemName: "person.fill")
                    .font(.system(size: 34, weight: .heavy))
                
                VStack (alignment: .leading, spacing: 4){
                    Text("Username")
                        .font(.system(size: 24, weight: .bold))
                    HStack{
                        Circle()
                            .foregroundColor(Color.green)
                            .frame(width: 12, height: 12)
                        Text("Online")
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                    } //
                }
                Spacer()
            }
            padding()
            
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
            .navigationTitle("Main Message")
        }
        
  //  } // End VStack
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
