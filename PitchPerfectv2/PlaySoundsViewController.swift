//
//  PlaySoundsViewController.swift
//  PitchPerfectv2
//
//  Created by Tony Tong on 2018-10-22.
//  Copyright © 2018 TT. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {

    var theURL : URL?
    
    @IBOutlet weak var aLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        aLabel.text = theURL?.absoluteString
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
