//
//  ViewController.swift
//  MiraclePillsAllSizes
//
//  Created by Nabendu Biswas on 12/10/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryText: UITextField!
    
    @IBOutlet weak var pinLabel: UILabel!
    @IBOutlet weak var pinText: UITextField!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var rupeeLabel: UILabel!
    @IBOutlet weak var pillLabel: UILabel!
    
    @IBOutlet weak var pillImage: UIImageView!
    
    @IBOutlet weak var successImage: UIImageView!
    
    @IBOutlet weak var buynowImage: UIButton!
    
    let states = ["Goa", "Delhi", "Mizoram", "Kerela", "Bihar", "Uttrakhand"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buynowBtnPressed(_ sender: AnyObject) {
        successImage.isHidden = false
        buynowImage.isHidden = true
        countryLabel.isHidden = true
        countryText.isHidden = true
        pinLabel.isHidden = true
        pinText.isHidden = true
        stateLabel.isHidden = true
        cityText.isHidden = true
        cityLabel.isHidden = true
        addressText.isHidden = true
        addressLabel.isHidden = true
        nameText.isHidden = true
        nameLabel.isHidden = true
        rupeeLabel.isHidden = true
        pillLabel.isHidden = true
        pillImage.isHidden = true
        statePickerBtn.isHidden = true
        
        
    }

    @IBAction func stateBtnPressed(_ sender: AnyObject) {
        statePicker.isHidden = false
        countryLabel.isHidden = true
        countryText.isHidden = true
        pinLabel.isHidden = true
        pinText.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryLabel.isHidden = false
        countryText.isHidden = false
        pinLabel.isHidden = false
        pinText.isHidden = false
    }

}

