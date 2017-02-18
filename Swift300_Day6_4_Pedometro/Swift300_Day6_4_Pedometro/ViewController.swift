//
//  ViewController.swift
//  Swift300_Day6_4_Pedometro
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var labelPassos: UILabel!
    
    // MARK: - Properties
    
    let pedometro = CMPedometer()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func ligarPedometro(_ sender: UIButton) {
        
        if CMPedometer.isStepCountingAvailable(){
            
            self.pedometro.startUpdates(from: Date(), withHandler: { (data, error) in
                
                
                self.labelPassos.text = "\(data!.numberOfSteps)"
                
            })
            
        }
        
    }
    
}

