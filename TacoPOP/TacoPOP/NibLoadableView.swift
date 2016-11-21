//
//  NibLoadableView.swift
//  TacoPOP
//
//  Created by Nabendu Biswas on 19/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
        
    }
}

