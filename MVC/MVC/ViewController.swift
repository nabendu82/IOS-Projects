//
//  ViewController.swift
//  MVC
//
//  Created by Nabendu Biswas on 23/10/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var renameField: UITextField!
    
    let person = Person(first: "John", last: "Hancock")

    //@IBOutlet weak var bobbyImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /* Bad way
        fullName.text = "\(person.firstName) \(person.lastName)"
        */
        
        fullName.text = person.fullName
        /* Another Bad Way
        bobbyImg.layer.cornerRadius = 5.0
        bobbyImg.clipsToBounds = true */
        
        
        
    }


    @IBAction func btnPressed(_ sender: AnyObject) {
        if let txt = renameField.text {
            person.firstName = txt
            fullName.text = person.fullName
        }
        
    }


}

