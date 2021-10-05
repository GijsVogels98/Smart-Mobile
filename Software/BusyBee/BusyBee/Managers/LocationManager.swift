//
//  LocationManager.swift
//  BusyBee
//
//  Created by Gijs Vogels on 05/10/2021.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject{
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
}

extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else{ return }
        
        DispatchQueue.main.async {
            self.location = location
        }
    }
}
