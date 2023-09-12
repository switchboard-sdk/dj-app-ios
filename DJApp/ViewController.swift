//
//  ViewController.swift
//  DJApp
//
//  Created by Banto Balazs on 2023. 09. 11..
//

import UIKit

class ViewController: UIViewController {
    let audioSystem = MainAudioSystem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioSystem.loadA(path: Bundle.main.url(forResource: "lycka", withExtension: "mp3")!.absoluteString)
        audioSystem.loadB(path: Bundle.main.url(forResource: "nuyorica", withExtension: "m4a")!.absoluteString)
        
        audioSystem.start()
    }
    
    @IBAction func togglePlayButton(_ sender: Any) {
        audioSystem.startPlayback()
    }
}

