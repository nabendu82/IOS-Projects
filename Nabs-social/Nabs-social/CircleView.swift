//
//  CircleView.swift
//  Nabs-social
//
//  Created by Nabendu Biswas on 08/02/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
