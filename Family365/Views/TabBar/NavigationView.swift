//
//  NavigationView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI

struct NavigationView: View {
    
    var body: some View {
        
        TabView{
            
            MapView(viewModel: UserViewModel())
                .tabItem() {
                    Image (systemName: "map.circle")
                    Text ("Map")
                }
            
            ChatView()
                .tabItem() {
                    Image (systemName: "ellipsis.bubble.fill")
                    Text ("Chat")
                }
            
            SettingsView()
                .tabItem() {
                    Image (systemName: "slider.horizontal.3")
                    Text ("Settings")
                }
            
        } //End TabView
        
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
