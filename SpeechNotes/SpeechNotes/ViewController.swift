//
//  ViewController.swift
//  SpeechNotes
//
//  Created by Nabendu Biswas on 30/05/17.
//  Copyright © 2017 Nabendu Biswas. All rights reserved.
//

import UIKit
import Speech

class ViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    private let audioEngine = AVAudioEngine()
    private let audioSession = AVAudioSession.sharedInstance()
    private var recognizerRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var speechAlertLabel: UILabel!
    @IBOutlet weak var speechFromFileButton: UIButton!
    
    @IBOutlet weak var speechFromMicButton: UIButton!
    
    @IBAction func speechRecognizerFromMic(_ sender: UIButton) {
        if audioEngine.isRunning{
            audioEngine.stop()
            recognizerRequest?.endAudio()
            speechFromMicButton.isEnabled = false
            speechFromMicButton.setTitle("Stopping", for: .disabled)
            self.speechAlertLabel.text = "Finishing Speech recognizer"
        } else {
            speechFromMicButton.isEnabled = true
            speechFromMicButton.setTitle("Recognizing Speech...", for: [])
            startRecording()
        }
    }
    
    @IBAction func speechRecognizerFromFile(_ sender: UIButton) {
//        if let path = Bundle.main.url(forResource: "HelloWorld", withExtension: "mp3") {
//            let request = SFSpeechURLRecognitionRequest(url: path)
//            speechRecognizer?.recognitionTask(with: request, resultHandler: { (result:SFSpeechRecognitionResult?, error:NSError?) in
//                if result == nil {
//                    print("Fail to recognize: \(String(describing: error?.localizedDescription))")
//                    return
//                }
//                OperationQueue.main.addOperation {
//                    self.textView.text = result?.bestTranscription.formattedString
//                }
//            } as! (SFSpeechRecognitionResult?, Error?) -> Void)
//
        
        
//    }
        if let path = Bundle.main.url(forResource: "HelloWorld", withExtension: "mp3") {
            let recognizer = SFSpeechRecognizer()
            let request = SFSpeechURLRecognitionRequest(url: path)
            recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                if let error = error {
                    print("Error: \(error)")
                } else {
                    print("Fail to recognize: \(String(describing: error?.localizedDescription))")
                }
            })
        } else {
            print("MP3 file not found")
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechAlertLabel.isHidden = true
        speechFromFileButton.isEnabled = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        speechRecognizer?.delegate = self
        SFSpeechRecognizer.requestAuthorization { (authStatus: SFSpeechRecognizerAuthorizationStatus) in
            var text = String()
            var color = UIColor()
            var isEnabled = Bool()
            switch authStatus{
                case .authorized:
                    text = "Speech recognizer is ready to use"
                    isEnabled = true
                    color = UIColor.green
                case .denied:
                    text = "User denied access to Speech recognizer"
                    isEnabled = true
                    color = UIColor.green
                case .notDetermined:
                    text = "Speech recognizer not yet authorized"
                    isEnabled = true
                    color = UIColor.green
                case .restricted:
                    text = "Speech recognizer restrict to this device"
                    isEnabled = true
                    color = UIColor.green
                
                
            }
            OperationQueue.main.addOperation {
                self.speechAlertLabel.isHidden = false
                self.speechAlertLabel.text = text
                self.speechAlertLabel.textColor = color
                self.speechFromFileButton.isEnabled = isEnabled
                self.speechFromMicButton.isEnabled = isEnabled
                
            }
        }
        
    }
    
    func setupMic() {
        do{
            try audioSession.setCategory(AVAudioSessionCategoryRecord)
            try audioSession.setMode(AVAudioSessionModeMeasurement)
        } catch {
            print("Error setting up mic")
        }
    }
    
    func startRecording(){
        if let tempRecognitionTask = recognitionTask {
            tempRecognitionTask.cancel()
            self.recognitionTask = nil
            }
            recognizerRequest = SFSpeechAudioBufferRecognitionRequest()
        
        do {
            try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
            guard let inputNode = audioEngine.inputNode else { fatalError("Audio engine has no input node")}
            guard let recognizerRequest = recognizerRequest else { fatalError("Fail to create recognition request")}
            recognizerRequest.shouldReportPartialResults = true
            startRecognitionTask(inputNode)
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, time: AVAudioTime ) in
                self.recognizerRequest?.append(buffer)
            }
            audioEngine.prepare()
            try audioEngine.start()
            self.speechAlertLabel.text = "Recording..."
        } catch {
            print("Error starting the record sesion")
            
        }
    }
    
    func startRecognitionTask(_ inputNode: AVAudioInputNode){

        recognitionTask = speechRecognizer?.recognitionTask(with: recognizerRequest!) { (result: SFSpeechRecognitionResult?, error: NSError?) in
            var isFinal = false
            if let result = result {
                self.textView.text = result.bestTranscription.formattedString
                isFinal = result.isFinal
            }
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognizerRequest = nil
                self.recognitionTask = nil
                
                
                self.speechFromMicButton.isEnabled = true
                self.speechFromMicButton.setTitle("Recognize From Mic", for: [])
                self.speechAlertLabel.text = "Speech recognizer is ready to use                "
                
                
                
            }
        }
        
    }




}

