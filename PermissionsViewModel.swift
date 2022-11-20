//
//  PermissionsViewModel.swift
//  TestPKCV
//
//  Created by Branislav Jovanović on 31.3.22..
//

import Foundation
import SwiftUI

class PermissionsViewModel: ObservableObject {
    
    static let shared = PermissionsViewModel()
    @ObservedObject var locationModel = LocationManager()
    @ObservedObject var notificationModel = NotificationsManager()
//    @ObservedObject var bluetoothManager = BluetoothManager()
    
    @Published var dataArray = [String]()
    
    func circleColor(availability: String) -> Color {
      switch availability {
      case "true":
        return .green
      case "false":
        return .red
      case "0":
        return .red
      case "1":
        return .red
      case "2":
        return .red
      default:
        return .green
      }
    }
    
    func openPermissionsSettings() {
      guard
        let bundleId = Bundle.main.bundleIdentifier,
        let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(bundleId)")
      else { return }
      UIApplication.shared.open(url)
    }
    
//    func updatePermissions(){
//        self.dataArray = [
//            locationModel.locationAuthorizationStatus.rawValue.description,
//            (!locationModel.locationIsDisabled).description,
//            notificationModel.notificationAuthorizationStatus.description,
//            bluetoothManager.isBleOn.description
//        ]
//    }
}
