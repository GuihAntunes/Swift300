//
//  ViewController.swift
//  Swift300_Day6_5_Magnetometer
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var labelMFX: UILabel!
    @IBOutlet weak var labelMFY: UILabel!
    @IBOutlet weak var labelMFZ: UILabel!
    
    // MARK: - Properties
    
    let motionManager = CMMotionManager()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    
    @IBAction func ligarMagnetometro(_ sender: UIButton) {
        
        if motionManager.isMagnetometerAvailable {
            
            motionManager.startMagnetometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                self.labelMFX.text = "\(data!.magneticField.x) µT"
                self.labelMFY.text = "\(data!.magneticField.y) µT"
                self.labelMFZ.text = "\(data!.magneticField.z) µT"
                
            })
            
        }
        
    }
    
}

