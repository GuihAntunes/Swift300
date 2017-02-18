//
//  ViewController.swift
//  Swift300_Day6_1_AVAudioRecorder
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
        
    // MARK: - Outlets
        
    // MARK: - Properties
    
    var myPlayer : AVAudioPlayer!
    var recorder : AVAudioRecorder!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(documentsPath)
        print(filePath)
            
    }
        
    // MARK: - Methods
        
    // MARK: - Actions
    
    @IBAction func record(_ sender: UIButton) {
        
        // Criando uma URL a partir do nosso filePath
        let audioUrl = URL(fileURLWithPath: filePath)
        
        /*
         
         A gravação de áudio requer um dicionário de configuração para definir:
         
         Qualidade, número de canais, bit rate, sample rate
         
         */
        
        let configsDictionary : Dictionary <String, AnyObject> = [AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue as AnyObject, AVEncoderBitRateKey : 16 as AnyObject, AVNumberOfChannelsKey : 2 as AnyObject, AVSampleRateKey : 44100.0 as AnyObject]
        
        do{
            
            try self.recorder = AVAudioRecorder(url: audioUrl, settings: configsDictionary)
        
            // Criando a Audio Session
        
            let audioSession = AVAudioSession.sharedInstance()

            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            
            try audioSession.setActive(true)
            
        }catch{}
        
        // Preparando para gravar
        self.recorder.prepareToRecord()
        // Gravando
        self.recorder.record()
        
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        
        // Verificamos se ele está instanciado
        guard let _ = self.recorder else {
            
            let alert = UIAlertController(title: "Warning", message: "You're not recording nothing!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        // Verificando se o gravador está gravando
        if self.recorder.isRecording {
            
            self.recorder.stop()
            
        }
        
    }
    
    @IBAction func play(_ sender: UIButton) {
        
        // Verificando se o arquivo existe
        
        if FileManager.default.fileExists(atPath: filePath) {
            
            // Refactor this verification 👇🏻
            // Verificando se ainda está sendo gravado
            
            guard let _ = self.recorder else {
                return
            }
            
            if self.recorder.isRecording {
                
                self.recorder.stop()
                
            }
            
            let audioUrl = URL(fileURLWithPath: filePath)
            
            // Iniciando nosso player baseado na URL
            
            do{
                
                try self.myPlayer = AVAudioPlayer(contentsOf: audioUrl)
                
                // Resgatando a instância compartilhada da nossa session de áudio
                let audioSession = AVAudioSession.sharedInstance()
                
                // Setando a categoria da nossa session de áudio
                try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                
                // Ativando a session de áudio
                try audioSession.setActive(true)
                
            }catch{}
            
            self.myPlayer.prepareToPlay()
            self.myPlayer.play()
            
        }else{
            
            let alert = UIAlertController(title: "Warning!", message: "The file doesn't exist! Recording something to reproduce audio!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func pause(_ sender: UIButton) {
        
        // Verificando se o player está instanciado
        guard let _ = self.myPlayer else {
            return
        }
        
        if self.myPlayer.isPlaying {
    
            self.myPlayer.pause()
            
        }

    }
        
}




