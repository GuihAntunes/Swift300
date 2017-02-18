//
//  ViewController.swift
//  Swift300_Day6_2_CoreMotion
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var labelX: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var labelZ: UILabel!
    
    @IBOutlet weak var labelRoll: UILabel!
    @IBOutlet weak var labelYaw: UILabel!
    @IBOutlet weak var labelPitch: UILabel!
    
    @IBOutlet weak var progressX: UIProgressView!
    @IBOutlet weak var progressY: UIProgressView!
    @IBOutlet weak var progressZ: UIProgressView!
    
    @IBOutlet weak var progressRoll: UIProgressView!
    @IBOutlet weak var progressYaw: UIProgressView!
    @IBOutlet weak var progressPitch: UIProgressView!
    
    
    // MARK: - Properties
    
    // Criando o objeto da classe que gerencia o acesso aos sensores
    
    let motionManager : CMMotionManager = CMMotionManager()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func start(_ sender: UIButton) {
        
        // Acelerômetro

        // Verificando se o acelerômetro está disponível
        if motionManager.isAccelerometerAvailable {
            
            motionManager.accelerometerUpdateInterval = 0.01
            
            motionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                self.labelX.text = "\(data!.acceleration.x)"
                self.labelY.text = "\(data!.acceleration.y)"
                self.labelZ.text = "\(data!.acceleration.z)"
                
                self.progressX.progress = Float(data!.acceleration.x)
                self.progressY.progress = Float(data!.acceleration.y)
                self.progressZ.progress = Float(data!.acceleration.z)
                
            })
            
        }
        
        
        // Giroscópio
        
        if motionManager.isDeviceMotionAvailable {
            
            motionManager.deviceMotionUpdateInterval = 0.01
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                /*
                 
                 Row - Intervalo considerado de -3 a 3
                 Yaw - Intervalo considerado de -3 a 3
                 Pitch - Intervalo considerado de -1.5 a 1.5
                 
                 */
                
                self.labelRoll.text = "\(data!.attitude.roll)"
                self.labelYaw.text = "\(data!.attitude.yaw)"
                self.labelPitch.text = "\(data!.attitude.pitch)"
                
                self.progressRoll.progress = Float(data!.attitude.roll)
                self.progressYaw.progress = Float(data!.attitude.yaw)
                self.progressPitch.progress = Float(data!.attitude.pitch)
                
                
            })
            
        }
        
    }
    
}

