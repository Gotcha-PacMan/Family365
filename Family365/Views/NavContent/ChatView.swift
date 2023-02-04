//
//  ChatView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI

struct ChatView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.red
            
            Image(systemName: "ellipsis.bubble.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
            
        }
        
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
