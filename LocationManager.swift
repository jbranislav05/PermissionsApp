//
//  LocationManager.swift
//  TestPKCV
//
//  Created by Branislav Jovanović on 31.3.22..
//

import CoreLocation
import Foundation

class LocationManager: NSObject, ObservableObject {
    
    var locationManager: CLLocationManager!
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()

        locationManager = CLLocationManager()
        locationManager.delegate = self
    }

    public func requestAuthorisation(always: Bool = false) {
        if always {
            self.locationManager.requestAlwaysAuthorization()

        } else {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension LocationManager {
    var locationIsDisabled: Bool {
      locationAuthorizationStatus == .denied ||
        locationAuthorizationStatus == .notDetermined ||
        locationAuthorizationStatus == .restricted
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationAuthorizationStatus = locationManager.authorizationStatus
    }
}
