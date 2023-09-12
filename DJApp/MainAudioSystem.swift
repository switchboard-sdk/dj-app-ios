//
//  MainAudioSystem.swift
//  DJApp
//
//  Created by Banto Balazs on 2023. 09. 11..
//

import SwitchboardSDK
import SwitchboardSuperpowered

class MainAudioSystem {
    let audioGraph = SBAudioGraph()
    let audioPlayerNodeA = SBAdvancedAudioPlayerNode()
    let audioPlayerNodeB = SBAdvancedAudioPlayerNode()
    let gainNodeA = SBGainNode()
    let gainNodeB = SBGainNode()
    let compressorNodeA = SBCompressorNode()
    let compressorNodeB = SBCompressorNode()
    let flangerNodeA = SBFlangerNode()
    let flangerNodeB = SBFlangerNode()
    let reverbNodeA = SBReverbNode()
    let reverbNodeB = SBReverbNode()
    let filterNodeA = SBFilterNode()
    let filterNodeB = SBFilterNode()
    let mixerNode = SBMixerNode()
    let audioEngine = SBAudioEngine()

    init() {
        audioPlayerNodeA.isLoopingEnabled = true
        audioPlayerNodeB.isLoopingEnabled = true

        audioGraph.addNode(audioPlayerNodeA)
        audioGraph.addNode(audioPlayerNodeB)
        audioGraph.addNode(mixerNode)
        audioGraph.addNode(gainNodeA)
        audioGraph.addNode(gainNodeB)

        audioGraph.addNode(compressorNodeA)
        audioGraph.addNode(compressorNodeB)
        audioGraph.addNode(flangerNodeA)
        audioGraph.addNode(flangerNodeB)
        audioGraph.addNode(reverbNodeA)
        audioGraph.addNode(reverbNodeB)
        audioGraph.addNode(filterNodeA)
        audioGraph.addNode(filterNodeB)

        audioGraph.connect(audioPlayerNodeA, to: gainNodeA)
        audioGraph.connect(gainNodeA, to: compressorNodeA)
        audioGraph.connect(compressorNodeA, to: flangerNodeA)
        audioGraph.connect(flangerNodeA, to: reverbNodeA)
        audioGraph.connect(reverbNodeA, to: filterNodeA)
        audioGraph.connect(filterNodeA, to: mixerNode)

        audioGraph.connect(audioPlayerNodeB, to: gainNodeB)
        audioGraph.connect(gainNodeB, to: compressorNodeB)
        audioGraph.connect(compressorNodeB, to: flangerNodeB)
        audioGraph.connect(flangerNodeB, to: reverbNodeB)
        audioGraph.connect(reverbNodeB, to: filterNodeB)
        audioGraph.connect(filterNodeB, to: mixerNode)

        audioGraph.connect(mixerNode, to: audioGraph.outputNode)
        audioEngine.start(audioGraph)
    }
    
    func start() {
        audioEngine.start(audioGraph)
    }

    func stop() {
        audioEngine.stop()
    }
    
    func pausePlayback() {
        audioGraph.stop()
        audioPlayerNodeA.pause()
        audioPlayerNodeB.pause()
    }

    func startPlayback() {
        audioPlayerNodeA.play()
        audioPlayerNodeB.play()
        audioGraph.start()
    }

    func loadA(path: String) {
        audioPlayerNodeA.load(path)
    }

    func loadB(path: String) {
        audioPlayerNodeB.load(path)
    }
    
    func isPlaying() -> Bool {
        return audioPlayerNodeA.isPlaying || audioPlayerNodeB.isPlaying
    }
}
