//
//  ViewController.swift
//  NabsChat
//
//  Created by Nabendu Biswas on 11/02/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import UIKit

class ViewController: AVCamCameraViewController {

    @IBOutlet weak var previewView: AVCamPreviewView!
    override func viewDidLoad() {
        
        
        self._previewView = previewView
        
        super.viewDidLoad()
        
    }




}

