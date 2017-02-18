//
//  NewRecordViewController.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import AVFoundation

class NewRecordViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var recordProgressView: UIProgressView!
    
    // MARK: - Properties
    
    var recorder:AVAudioRecorder!
    var titulo = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func startRecord(_ sender: UIButton) {
        
        guard let _ = self.recorder else {
            return
        }
        
        let alert = UIAlertController(title: "Definição de Título", message: "Defina o título da sua gravação", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (acao) in
            
            guard case self.titulo? = alert.textFields?[0].text else {
                return
            }
            
            if self.titulo.isEmpty {
                
                let warning = UIAlertController(title: "Nenhum nome informado!", message: "Digite o nome da gravação", preferredStyle: .alert)
                
                let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                warning.addAction(okButton)
                
                self.present(warning, animated: true, completion: nil)
                
            }else{
                
                addRecord(nome: self.titulo)
                
            }
            
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        let audioUrl = getARecord(nome: self.titulo)
        
        let configsDictionary : Dictionary <String, Any> = [AVEncoderAudioQualityKey : AVAudioQuality.max as Any, AVEncoderBitRateKey : 16 as Any, AVNumberOfChannelsKey : 2, AVSampleRateKey : 44100.0 as Any]
        
        do{
            
            try self.recorder = AVAudioRecorder(url: audioUrl, settings: configsDictionary)
            
            let audioSession = AVAudioSession.sharedInstance()
            
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            
            try audioSession.setActive(true)
            
        }catch{}
        
        self.recorder.prepareToRecord()
        
        
        
        self.present(alert, animated: true) { 
            self.recorder.record()
        }
        
    }
    
    @IBAction func stopRecord(_ sender: UIButton) {
        
        
        
    }
    
}
