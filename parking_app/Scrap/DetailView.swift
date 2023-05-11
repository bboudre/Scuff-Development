//
//  DetailView.swift
//  parking_app
//
//  Created by Bianka B on 4/12/23.
//

import SwiftUI
import MapKit

// search building
// show lots closet to building and the available spots open
// show navigation to parking lot

// available spots
// distance

// calculate who is closet to parking lot and update




struct DetailView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = DetailViewModel()

    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkLocationIsEnabled()
            }
        
        
    NavigationStack {
        Text("\(searchText)")
            .navigationTitle("Where to?")
    }
    .searchable(text: $searchText, prompt: "Search buildings" )
        
        
    } // body view
} // detail view

    
final class DetailViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
            
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 32.2793, longitude: -106.7491), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    var locationManager:CLLocationManager?
    
    func checkLocationIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        }
        else {
            print("Location is off")
        }
    } // checkLocationIsEnabled
    
    
    private func checkLocationAuth() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
    
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely de to parental controls")
        case .denied:
            print("App location is denied. Go to settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
        
    } // checkLocationAuth
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
    
    
} // view model
    


