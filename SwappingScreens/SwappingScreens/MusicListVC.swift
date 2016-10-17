//
//  MusicListVC.swift
//  SwappingScreens
//
//  Created by Nabendu Biswas on 16/10/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit

class MusicListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
        
    }
    

    @IBAction func backBtnPressed(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
    }
  

    @IBAction func load3rdScreenPressed(_ sender: AnyObject) {
        let songTitle = "Every night in my dreams"
        performSegue(withIdentifier: "PlaySongVC", sender: songTitle)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlaySongVC {
            
            if let song = sender as? String {
                destination.selectedSong = song                
            }
            
            
        }
    }
    

}
