//
//  ViewController.swift
//  Swift300_Day5_3_AVAudioPlayer
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var labelRate: UILabel!
    
    // MARK: - Properties
    
    var myPlayer : AVAudioPlayer!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        
    }
    
    // MARK: - Methods
    
    func setup() {
        
        self.labelRate.text = ""
        
    }
    
    // MARK: - Actions
    @IBAction func play(_ sender: UIButton) {
        
        // Criando o caminho para o resgate do arquivo
        let filePath = Bundle.main.path(forResource: "dubstep", ofType: "m4a")
        
        let fileURL = URL(fileURLWithPath: filePath!)
        
        // Iniciando o nosso audio player
        self.myPlayer = try? AVAudioPlayer(contentsOf: fileURL)
        
        // Propriedade que define o número de vezes que o audio irá ocorrer
        self.myPlayer.numberOfLoops = 2
        
        // ==========
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do{
            
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            
        }catch{}
        
        do{
            
            try audioSession.setActive(true)
            
        }catch{}
        // ==========
        
        // Método que prepara o device
        self.myPlayer.prepareToPlay()
        
        // Dando o play
        self.myPlayer.play()
        
    }
    
    @IBAction func pause(_ sender: UIButton) {
        
        
        
    }
    
    @IBAction func changeRate(_ sender: UISlider) {
        
        
        
    }
    

    
}

