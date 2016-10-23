//
//  Person.swift
//  MVC
//
//  Created by Nabendu Biswas on 23/10/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import Foundation

class Person {
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        get {
            return _firstName
        }
        set {
            
                _firstName = newValue
            }
    }
    
    var lastName: String {
        return _lastName
    }
    
    init(first: String, last: String) {
        self._firstName = first
        self._lastName = last
    }
    
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    
}
