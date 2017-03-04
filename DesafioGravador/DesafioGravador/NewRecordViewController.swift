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
    var timer : Timer!
    var progress : Float = 0.0
    var dictionaryOfFiles : NSDictionary = [:]
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(documentsPath)
        self.recordProgressView.progress = 0.0
        
        if FileManager.default.fileExists(atPath: recordsFilePath){
            
            // Unwrap this
            self.dictionaryOfFiles = NSDictionary(contentsOfFile: recordsFilePath)!
            
        }
        
    }
    
    // MARK: - Methods
    
    func updateProgress() {
        
        self.progress = self.progress + 0.1
        self.recordProgressView.setProgress(self.progress, animated: true)
        
        if self.progress >= 1 {
            
            self.timer.invalidate()
            self.progress = 0.0
            self.recordProgressView.progress = 0.0
            
        }
        
    }
    
    // MARK: - Actions
    @IBAction func startRecord(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Definição de Título", message: "Defina o título da sua gravação", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (acao) in
            
            let textField = alert.textFields![0]
            
            // TODO: Unwrap this optional
            self.titulo = textField.text!
            
            if self.titulo.isEmpty {
                
                self.present(alert, animated: true, completion: nil)
                
            }else{
                
                let newFile = self.titulo
                addRecord(nome: newFile)
                
                let configsDictionary : Dictionary <String , AnyObject> = [AVEncoderAudioQualityKey : AVAudioQuality.min.rawValue as AnyObject, AVEncoderBitRateKey : 16 as AnyObject, AVNumberOfChannelsKey : 2 as AnyObject, AVSampleRateKey : 44100.0 as AnyObject]
                
                self.recorder = try? AVAudioRecorder(url: getARecord(nome: newFile), settings: configsDictionary) // TODO: Verificar casting [String : AnyObject]
                
                let audioSession = AVAudioSession.sharedInstance()
                
                do{
                    
                    try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
                    
                }catch{}
                
                do{
                    
                    try audioSession.setActive(true)
                    
                }catch{}
                
                // Preparando pra gravar
                self.recorder.prepareToRecord()
                self.recorder.record(forDuration: 10.0)
                
                let filesToSave = getAllRecords()
                filesToSave.write(toFile: recordsFilePath, atomically: true)
                
                self.recordProgressView.progress = 0.0
                
                self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(NewRecordViewController.updateProgress), userInfo: nil, repeats: true)
                
            }
            
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Qual o título desejado?"
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func stopRecord(_ sender: UIButton) {
        
        guard let _ = self.recorder else {
            return
        }
        
        if self.recorder.isRecording {
            self.recorder.stop()
            self.timer.invalidate()
            self.recordProgressView.progress = 0.0
        }
        
    }
    
}
