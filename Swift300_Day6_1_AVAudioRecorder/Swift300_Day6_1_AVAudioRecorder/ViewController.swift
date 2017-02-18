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
            
        }catch{}
        
        // Criando a Audio Session
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do{
            
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            
        }catch{}
        
        do{
            
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
        
        
        
    }
    
    @IBAction func pause(_ sender: UIButton) {
        
        
        
    }
        
}




