//
//  MapView.swift
//  Family365
//
//  Created by Warat T on 2023-02-03.
//

import SwiftUI

struct MapView: View {
    
    let viewModel: UserViewModel
    
    var body: some View {
        
        UsersMapView(annotations: viewModel.getUser())
         
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(viewModel: UserViewModel())
            
    }
}




//import MapKit

//  @StateObject private var viewModel = MapViewModel()
 
//  @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 59.31433251331741, longitude: 18.02367210388184), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
  

/* ZStack{
    Map(coordinateRegion: $mapRegion)
    }
    onAppear(){
        viewModel.checkIfLocationServiceIsEnabled()
    }
*/


/* final class MapViewModel: NSObject, ObservableObject,
                          CLLocationManagerDelegate{
    
    var locationManager : CLLocationManager?
    
    func checkIfLocationServiceIsEnabled() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.delegate = self
        } else {
            print ("Show an alert letting them know this is off and to go settings.")
        }
    }
    
  private func checkLocationAuthorization () {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus{
                
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your locations is restricted likely due to parental controls.")
        case .denied:
            print("You have denied the locationsaccess.")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
} */
