//
//  ViewController.swift
//  Notifications
//
//  Created by Nabendu Biswas on 23/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1. Request permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (granted, error) in
            if granted {
                print("Notification access granted")
            } else {
                print(error?.localizedDescription as Any)
                
            }
            
        })
        
        
        

    }

   
    @IBAction func notifyButtonTapped(_ sender: Any) {
        scheduleNotification(inSeconds: 5, completion: { success in
            if success {
                print("Sucessfully scheduled notification")
            } else {
                print("Error scheduling notification ")
            }
        })
    }
    
    func scheduleNotification(inSeconds: TimeInterval, completion: @escaping (_ Success: Bool) -> ()) {
        //Add an attachment
        let myImage = "Witch_2"
        guard let imageUrl = Bundle.main.url(forResource: myImage, withExtension: "gif") else {
            completion(false)
            return
        }
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "myNotification", url: imageUrl, options: .none)
        
        
        let notif = UNMutableNotificationContent()
        
        //Only for Extension
        notif.categoryIdentifier = "myNotificationCategory"
        
        
        notif.title = "New Notification"
        notif.subtitle = "These are great!"
        notif.body = "The new notification option in ios 10 are awesome"
        
        notif.attachments = [attachment]
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error as Any)
                completion(false)
            } else {
                completion(true)
            }
            
        })
    }

}

