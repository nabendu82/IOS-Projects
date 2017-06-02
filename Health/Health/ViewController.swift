//
//  ViewController.swift
//  Health
//
//  Created by Nabendu Biswas on 26/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {
    
    var workout: WorkoutDetails?

    override func viewDidLoad() {
        super.viewDidLoad()
        INPreferences.requestSiriAuthorization { (status:INSiriAuthorizationStatus) in
            print("The Siri status is: \(status.rawValue)")
        }
        
    }



}

