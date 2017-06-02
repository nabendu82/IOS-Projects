//
//  IntendEndWorkoutHandler.swift
//  Health
//
//  Created by Nabendu Biswas on 29/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import Foundation
import Intents

class IntendEndWorkoutHandler: NSObject, INEndWorkoutIntentHandling {
    
    func handle(endWorkout intent: INEndWorkoutIntent, completion: @escaping (INEndWorkoutIntentResponse) -> Void) {
        completion(INEndWorkoutIntentResponse.init(code: .ready, userActivity: nil
        ))
    }

}
