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
            
            MapView()
                .tabItem() {
                    Image (systemName: "map.circle")
                    Text ("Map")
                } //End MapView
            
            ChatView()
                .tabItem() {
                    Image (systemName: "ellipsis.bubble.fill")
                    Text ("Chat")
                } //End ChatView
            
            SettingsView()
                .tabItem() {
                    Image (systemName: "slider.horizontal.3")
                    Text ("Settings")
                } //End SettingsView
            
        } //End TabView
        
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
