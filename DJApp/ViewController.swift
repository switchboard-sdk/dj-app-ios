//
//  ViewController.swift
//  DJApp
//
//  Created by Banto Balazs on 2023. 09. 11..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playbackRateSliderA: UISlider!
    @IBOutlet weak var volumeSliderA: UISlider!
    @IBOutlet weak var playbackRateSliderB: UISlider!
    @IBOutlet weak var volumeSliderB: UISlider!
    @IBOutlet weak var compressorASwitch: UISwitch!
    @IBOutlet weak var flangerASwitch: UISwitch!
    @IBOutlet weak var reverbASwitch: UISwitch!
    @IBOutlet weak var filterASwitch: UISwitch!
    @IBOutlet weak var compressorBSwitch: UISwitch!
    @IBOutlet weak var reverbBSwitch: UISwitch!
    @IBOutlet weak var flangerBSwitch: UISwitch!
    @IBOutlet weak var filterBSwitch: UISwitch!
    @IBOutlet weak var crossfaderSlider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!
    
    let audioSystem = MainAudioSystem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playbackRateSliderA.value = Float(audioSystem.audioPlayerNodeAWithMasterControl.playbackRate)
        volumeSliderA.value = audioSystem.gainNodeA.gain
        
        playbackRateSliderB.value = Float(audioSystem.audioPlayerNodeB.playbackRate)
        volumeSliderB.value = audioSystem.gainNodeB.gain
        
        compressorASwitch.isOn = audioSystem.compressorNodeA.isEnabled
        reverbASwitch.isOn = audioSystem.reverbNodeA.isEnabled
        flangerASwitch.isOn = audioSystem.flangerNodeA.isEnabled
        filterASwitch.isOn = audioSystem.filterNodeA.isEnabled
        
        compressorBSwitch.isOn = audioSystem.compressorNodeB.isEnabled
        reverbBSwitch.isOn = audioSystem.reverbNodeB.isEnabled
        flangerBSwitch.isOn = audioSystem.flangerNodeB.isEnabled
        filterBSwitch.isOn = audioSystem.filterNodeB.isEnabled
        
        audioSystem.loadA(path: Bundle.main.url(forResource: "lycka", withExtension: "mp3")!.absoluteString)
        audioSystem.loadB(path: Bundle.main.url(forResource: "nuyorica", withExtension: "m4a")!.absoluteString)
        
        audioSystem.setBeatGridInformationA(originalBPM: 126, firstBeatMs: 353)
        audioSystem.setBeatGridInformationB(originalBPM: 123, firstBeatMs: 40)
        
        audioSystem.setCrossfader(value: 0.0, volumeA: volumeSliderA.value, volumeB: volumeSliderB.value)

        audioSystem.start()
    }
    
    @IBAction func togglePlayButton(_ sender: Any) {
        if audioSystem.isPlaying() {
            playPauseButton.setTitle("Play", for: .normal)
            audioSystem.pausePlayback()
        } else {
            playPauseButton.setTitle("Pause", for: .normal)
            audioSystem.startPlayback()
        }
    }
    
    @IBAction func crossfaderChanged(_ sender: Any) {
        audioSystem.setCrossfader(value: crossfaderSlider.value, volumeA: volumeSliderA.value, volumeB: volumeSliderB.value)
    }
    
    @IBAction func playbackRateAChanged(_ sender: Any) {
        audioSystem.setPlaybackRateA(rate: playbackRateSliderA.value)
    }
    
    @IBAction func volumeSliderChangedA(_ sender: Any) {
        audioSystem.setVolumeA(volume: volumeSliderA.value)
    }
    
    @IBAction func playbackRateBChanged(_ sender: Any) {
        audioSystem.setPlaybackRateB(rate: playbackRateSliderB.value)
    }
    
    @IBAction func volumeSliderBChanged(_ sender: Any) {
        audioSystem.setVolumeB(volume: volumeSliderB.value)
    }
    
    @IBAction func filterBSwitched(_ sender: Any) {
        audioSystem.enableFilterB(enable: filterBSwitch.isOn)
    }
    
    @IBAction func flangerBSwitched(_ sender: Any) {
        audioSystem.enableFlangerB(enable: flangerBSwitch.isOn)
    }
    
    @IBAction func reverbBSwitched(_ sender: Any) {
        audioSystem.enableReverbB(enable: reverbBSwitch.isOn)
    }
    
    @IBAction func compressorBSwitched(_ sender: Any) {
        audioSystem.enableCompressorB(enable: compressorBSwitch.isOn)
    }
    
    @IBAction func filterASwitched(_ sender: Any) {
        audioSystem.enableFilterA(enable: filterASwitch.isOn)
    }
    
    @IBAction func flangerASwitched(_ sender: Any) {
        audioSystem.enableFlangerA(enable: flangerASwitch.isOn)
    }
    
    @IBAction func compressorASwitched(_ sender: Any) {
        audioSystem.enableCompressorA(enable: compressorASwitch.isOn)
    }
    
    @IBAction func reverbASwitched(_ sender: Any) {
        audioSystem.enableReverbA(enable: reverbASwitch.isOn)
    }
}

