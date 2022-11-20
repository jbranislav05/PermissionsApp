//
//  NotificationManager.swift
//  TestPKCV
//
//  Created by Branislav Jovanović on 31.3.22..
//

import Foundation
import UserNotifications

class NotificationsManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    var currentNotification: UNUserNotificationCenter!
    @Published var notificationAuthorizationStatus: Bool = false

    override init() {
        super.init()
        
        currentNotification = UNUserNotificationCenter.current()
        currentNotification.delegate = self
    }
    
    func getStatus(){
        currentNotification.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if granted {
                DispatchQueue.main.async {
                    self.notificationAuthorizationStatus = granted
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
