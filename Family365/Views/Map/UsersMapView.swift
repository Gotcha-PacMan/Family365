//
//  UsersMapView.swift
//  Family365
//
//  Created by Warat T on 2023-02-15.
//

import SwiftUI
import MapKit

final class UsersAnnotationViewModel: NSObject {
    
    let latitude: Double
    let longtitude: Double
    let name: String
    let address: String
    let isOpen: Bool
    
    init(latitude: Double, longtitude: Double, name: String, address: String, isOpen: Bool) {
        self.latitude = latitude
        self.longtitude = longtitude
        self.name = name
        self.address = address
        self.isOpen = isOpen
        super.init()
    }
    
}

extension UsersAnnotationViewModel: MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D (latitude: latitude, longitude: longtitude)
    }
}

struct UsersMapView: UIViewRepresentable {
    
    let annotations: [UsersAnnotationViewModel]
    
    func makeUIView(context: Context) -> MKMapView {
        
        let map = MKMapView()
        let center = CLLocationCoordinate2D(latitude: 59.31433251331741, longitude: 18.02367210388184)
        map.setCamera(MKMapCamera(lookingAtCenter: center, fromEyeCoordinate: center, eyeAltitude: 2000), animated: true)
        
        return map
        
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        
        mapView.addAnnotations(annotations)
        
    }
    
}
