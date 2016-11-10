//
//  Location.swift
//  RainyShiny
//
//  Created by Nabendu Biswas on 08/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
    
    
}


