//
//  TacoPOP.swift
//  TacoPOP
//
//  Created by Nabendu Biswas on 19/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import Foundation

enum TacoShell: Int {
    case Flour = 1
    case Corn = 2
    
}

enum TacoProtein: String {
    case Beef = "Beef"
    case Chicken = "Chicken"
    case Brisket = "Brisket"
    case Fish = "Fish"
}

enum TacoCodiment: Int {
    case Loaded = 1
    case Plain = 2
}

struct Taco {
    private var _id: Int!
    private var _productName: String!
    private var _shellId: TacoShell!
    private var _proteinId: TacoProtein!
    private var _condimentId: TacoCodiment!
    
    var id: Int {
        return _id
    }
    
    var productName: String {
        return _productName
    }
    
    var shellId: TacoShell {
        return _shellId
    }
    
    var proteinId: TacoProtein {
        return _proteinId
    }
    
    var condimentId: TacoCodiment {
        return _condimentId
    }
    
    init(id: Int, productName: String, shellId: Int, proteinId: Int, condimentId: Int) {
        _id = id
        _productName = productName
        
        //Taco Shell
        switch shellId {
        case 2:
            self._shellId = TacoShell.Corn
        default:
            self._shellId = TacoShell.Flour
        }
        
        //Taco Protein
        switch proteinId {
        case 2:
            self._proteinId = TacoProtein.Chicken
        case 3:
            self._proteinId = TacoProtein.Brisket
        case 4:
            self._proteinId = TacoProtein.Fish
        default:
            self._proteinId = TacoProtein.Beef
        }
        
        switch condimentId {
        case 2:
            self._condimentId = TacoCodiment.Plain
        default:
            self._condimentId = TacoCodiment.Loaded
        }
        
        
    }
}
