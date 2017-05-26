//
//  ViewController.swift
//  Hello Xcode
//
//  Created by Nabendu Biswas on 18/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelHelloXcode: UILabel!
    
    @IBAction func buttonSayHello(_ sender: UIButton) {
        labelHelloXcode.text = "Hello Xcode"
        labelHelloXcode.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

