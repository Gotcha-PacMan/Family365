//
//  MapView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        
        ZStack {
            
            Color.green
            
            Image(systemName: "map.circle")
                .foregroundColor(Color.white)
                .font(.system(size: 100.0))
            
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
