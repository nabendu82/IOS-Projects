//
//  ViewController.swift
//  pushmynotifications
//
//  Created by Nabendu Biswas on 30/01/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        
        
        
    }


}

