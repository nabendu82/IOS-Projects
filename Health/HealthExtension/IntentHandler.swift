//
//  IntentHandler.swift
//  HealthExtension
//
//  Created by Nabendu Biswas on 26/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        if intent is INEndWorkoutIntent{
            return IntendEndWorkoutHandler()
        }
        
        return self
    }
    
}

extension IntentHandler:INStartWorkoutIntentHandling{
    func handle(startWorkout intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        completion(INStartWorkoutIntentResponse.init(code: .ready, userActivity: nil))
    }
    
}



