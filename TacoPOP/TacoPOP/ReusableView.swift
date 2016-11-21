//
//  ReusableView.swift
//  TacoPOP
//
//  Created by Nabendu Biswas on 19/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
