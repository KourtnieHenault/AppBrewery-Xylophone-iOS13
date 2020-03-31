//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        simulateButtonPressEffect(sender: sender)
        
        if let buttonTitle = sender.currentTitle {
                playSound(fileName: buttonTitle, fileExtension: "wav")
            
        }else {
            return
        }
    }
    
    func playSound(fileName: String, fileExtension: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    func simulateButtonPressEffect(sender: UIButton){
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
             sender.alpha = 1.0
         }
        
    }
    
}
