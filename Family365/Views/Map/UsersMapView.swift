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
    let calloutTapped: (UsersAnnotationViewModel) -> Void
    
    func makeCoordinator() -> UserMapViewCoordinate {
        return UserMapViewCoordinate(calloutTapped: calloutTapped)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let map = MKMapView()
        let center = CLLocationCoordinate2D(latitude: 59.31433251331741, longitude: 18.02367210388184)
        map.setCamera(MKMapCamera(lookingAtCenter: center, fromEyeCoordinate: center, eyeAltitude: 2000), animated: true)
        
        map.delegate = context.coordinator
        return map
        
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        
        mapView.addAnnotations(annotations)
        
    }
    
}

final class UserMapViewCoordinate: NSObject, MKMapViewDelegate {
    
    let calloutTapped: (UsersAnnotationViewModel) -> Void
    
    init (calloutTapped: @escaping (UsersAnnotationViewModel) -> Void) {
        self.calloutTapped = calloutTapped
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let userAnnotations = annotation as? UsersAnnotationViewModel else { return MKPinAnnotationView() }
        
        let marker = MKMarkerAnnotationView()
        marker.markerTintColor = userAnnotations.isOpen ? .blue : .gray
        marker.canShowCallout = true
        
        let calloutButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        calloutButton.setImage(UIImage(systemName: userAnnotations.isOpen ? "phone.fill" : "exclamationmark.triangle"), for: .normal)
        marker.rightCalloutAccessoryView = calloutButton
        
        let nameLabel = UILabel()
        nameLabel.text = userAnnotations.name
        marker.detailCalloutAccessoryView = nameLabel
        
        return marker
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let userAnnotation = view.annotation as? UsersAnnotationViewModel else { return }
        
        calloutTapped(userAnnotation)
        
    }
    
}
