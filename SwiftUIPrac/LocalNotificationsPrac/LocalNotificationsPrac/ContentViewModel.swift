//
//  ContentViewModel.swift
//  LocalNotificationsPrac
//
//  Created by SUCHAN CHANG on 2023/10/24.
//

import UserNotifications
import UIKit

final class ContentVieModel: ObservableObject {
    var timer: Timer?
    private var timeRemaining: Int = 10
    
    func startTimer() {
        guard timer == nil else { return }
        
        // 타이머가 백그라운드에서도 업데이트될 수 있도록 백그라운드 작업 개시
        var backgroundTaskID: UIBackgroundTaskIdentifier?
        backgroundTaskID = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            if let task = backgroundTaskID {
                UIApplication.shared.endBackgroundTask(task)
                backgroundTaskID = .invalid
            }
        })
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                print(self.timeRemaining)
                self.timeRemaining -= 1
            } else {
                self.stopTimer()
                self.scheduleLocalNotification()
                
                if let task = backgroundTaskID {
                    UIApplication.shared.endBackgroundTask(task)
                    backgroundTaskID = .invalid
                }
            }
            
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
        self.timeRemaining = 0
    }
    
    // Local Notification 요청 및 스케줄링(예약)
    private func scheduleLocalNotification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .badge]) { (granted, error) in
            if granted {
                
                let content = UNMutableNotificationContent()
                content.title = "Local Notification"
                content.body = "This is a simple local notification example."
                content.badge = 1
                content.sound = UNNotificationSound.default
                
                // Set the trigger for the notification (e.g., after 0.1 seconds)
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
                
                // Create a request with a unique identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // Schedule the notification
                center.add(request) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else {
                        print("Notification scheduled successfully.")
                    }
                }
                
            } else {
                print("Notification permission denied")
            }
        }
    }
}
