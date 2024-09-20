//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 5]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
           
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            progressBar.progress = 1.0
            playSound()
        }
        
        func playSound(){
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
    
    
//    second solution.
//    func createTimer(timeLeft: Int){
//        var time = timeLeft
//        
//        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {timer in
//            
//            time -= 1
//            
//            print(time)
//            
//            if(time==0){
//                timer.invalidate()
//            }
//        }
//    }
    

