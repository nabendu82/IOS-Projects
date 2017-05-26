//
//  WorkoutDetails.swift
//  Health
//
//  Created by Nabendu Biswas on 26/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import Foundation

class WorkoutDetails{
    var name:String = "Default Workout"
    let startTime:Date
    let endTime:Date?
    
    init(name:String?, startTime:Date, endTime:Date?){
        if let name = name{
            self.name = name
        }
        self.startTime = startTime
        self.endTime = endTime
    }
    
    convenience init(name:String?, startTime:Date){
        self.init(name: name, startTime: startTime, endTime: nil)
    }
    
    convenience init(startTime:Date){
        self.init(name: nil, startTime: startTime, endTime: nil)
    }
}
