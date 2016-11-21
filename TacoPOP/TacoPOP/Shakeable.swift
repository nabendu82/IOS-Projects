//
//  Shakeable.swift
//  TacoPOP
//
//  Created by Nabendu Biswas on 19/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

protocol Shakeable {}

extension Shakeable where Self: UIView {
    func shake() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.05
        anim.repeatCount = 5
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: center.y))
        anim.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: center.y))
        layer.add(anim, forKey: "position") 
        
    }
}
