//
//  CircleButton.swift
//  Scribed
//
//  Created by Nabendu Biswas on 21/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{
            setupView()
            
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }



}
