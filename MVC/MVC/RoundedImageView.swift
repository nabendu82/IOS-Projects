//
//  RoundedImageView.swift
//  MVC
//
//  Created by Nabendu Biswas on 23/10/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }

}
