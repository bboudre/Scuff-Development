//
//  LocationManager.swift
//  parking_app
//
//  Created by Bianka B on 4/22/23.
//
//  Location manager for LocationSearch 

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locatonManager = CLLocationManager()
    
    override init() {
        super.init()
        locatonManager.delegate = self
        locatonManager.desiredAccuracy = kCLLocationAccuracyBest
        locatonManager.requestWhenInUseAuthorization()
        locatonManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else { return }
        //locationManager.stopUpdatingLocation()
    }
}
