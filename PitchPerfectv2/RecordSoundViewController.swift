//
//  ViewController.swift
//  PitchPerfectv2
//
//  Created by Tony Tong on 2018-10-22.
//  Copyright © 2018 TT. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    
    let soundRecordingFileName = "recordedVoice.wav"
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    var audioRecorder : AVAudioRecorder!
    
    @IBAction func RecordButtonPressed(_ sender: Any) {
        configUI(bRecording: true)
        recordSound()
    }
    @IBAction func StopButtonPressed(_ sender: Any) {
        configUI(bRecording: false)
        audioRecorder.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        configUI(bRecording: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier! == "TransitionToPlaySoundView") {
            let destinationViewController = segue.destination as! PlaySoundsViewController
            let theURL = sender as! URL
            destinationViewController.recordedAudioURL = theURL;
        }
    }

    //once audio recording is finished, app will transition to the play sound screen
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        performSegue(withIdentifier: "TransitionToPlaySoundView", sender : audioRecorder.url)
    }
    
    //use AVFoundation objects like AVAudioSession and AVAudioRecorder to record sound
    func recordSound(){
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let pathArray = [dirPath, soundRecordingFileName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode:AVAudioSession.Mode.default)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    //UI elements states need to be updated together
    func configUI(bRecording : Bool){
        if (bRecording) {
            recordButton.isEnabled = false
            stopButton.isEnabled = true
            notificationLabel.text = "Tap Button Below to Stop Recording"
        }
        else {
            recordButton.isEnabled = true
            stopButton.isEnabled = false
            notificationLabel.text = "Tap Button Above to Record Sound"
        }
    }
}

