//
//  PlaySoundsViewController.swift
//  PitchPerfectv2
//
//  Created by Tony Tong on 2018-10-22.
//  Copyright © 2018 TT. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    
    @IBAction func stopButtonPressed(_ sender: Any) {
        stopAudio()
    }
    @IBAction func playSoundForButton(_ sender: Any) {
        configureUI(.playing)
        let btn = sender as! UIButton
        switch (btn.tag) {
        case 0:
            print("snail button pressed")
            playSound(rate:0.5)
        case 1:
            print("rabbit button pressed")
            playSound(rate:2.0)
        case 2:
            print("chipmunk button pressed")
            playSound(pitch:1000.0)
        case 3:
            print("vader button pressed")
            playSound(pitch:-1000.0)
        case 4:
            print("echo button pressed")
            playSound(echo:true)
        case 5:
            print("reverb button pressed")
            playSound(reverb:true)
        default:
            print("unknown button pressed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
        stopButton.isEnabled = false
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
