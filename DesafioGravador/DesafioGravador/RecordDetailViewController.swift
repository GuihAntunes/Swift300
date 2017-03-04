//
//  RecordDetailViewController.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import AVFoundation

class RecordDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    var player:AVAudioPlayer!
    
    var chosenFile : String?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func play(_ sender: UIButton) {
        
        let audioURL = URL(fileURLWithPath: (documentsPath as NSString).appendingPathComponent(chosenFile! + ".caf"))
        
        self.player = try? AVAudioPlayer(contentsOf: audioURL)
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do{
            
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            
        }catch{}
        
        do{
            
            try audioSession.setActive(true)
            
        }catch{}
        
        self.player.prepareToPlay()
        
        self.player.play()
        
    }
    
    @IBAction func stop(_ sender: UIButton) {
        
        guard let _ = self.player else {
            return
        }
        
        if self.player.isPlaying {
            
            self.player.stop()
            
        }
        
    }
    
}
