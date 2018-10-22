//
//  ViewController.swift
//  PitchPerfectv2
//
//  Created by Tony Tong on 2018-10-22.
//  Copyright © 2018 TT. All rights reserved.
//

import UIKit

class RecordSoundViewController: UIViewController {
    
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var NotificationLabel: UILabel!
    @IBOutlet weak var StopButton: UIButton!
    
    @IBAction func RecordButtonPressed(_ sender: Any) {
        configUI(bRecording: true)
    }
    @IBAction func StopButtonPressed(_ sender: Any) {
        configUI(bRecording: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        configUI(bRecording: false)
    }
    
    func configUI(bRecording : Bool){
        if (bRecording) {
            RecordButton.isEnabled = false
            StopButton.isEnabled = true
            NotificationLabel.text = "Tap Button Below to Stop Recording"
        }
        else {
            RecordButton.isEnabled = true
            StopButton.isEnabled = false
            NotificationLabel.text = "Tap Button Above to Record Sound"
        }
    }
}

