//
//  ViewController.swift
//  Scribed
//
//  Created by Nabendu Biswas on 21/11/16.
//  Copyright © 2016 Nabendu Biswas. All rights reserved.
//

import UIKit
import Speech
import AVFoundation


class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var transriptionTextField: UITextView!
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    var audioPlayer: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true

    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.stop()
        activitySpinner.stopAnimating()
        activitySpinner.isHidden = true
    }
    
    func requestSpeechAuth() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized {
                if let path = Bundle.main.url(forResource: "test", withExtension: "m4a") {
                    do {
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        self.audioPlayer.delegate = self
                        sound.play()
                    } catch {
                        print("Error")
                    }
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request) { (result, error) in
                        if let error = error {
                            print("There was an error \(error)")
                        } else {
                            self.transriptionTextField.text = result?.bestTranscription.formattedString
                        }
                        
                        
                    }
                }
            }
            
        }
        
    }


    @IBAction func playBtnPessed(_ sender: Any) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
    }

}

