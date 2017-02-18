//
//  ViewController.swift
//  Swift300_Day6_3_Altímetro
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var labelRelativeAltitude: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    
    // MARK: - Properties
    
    let altimetro = CMAltimeter()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func ligarAltimetro(_ sender: UIButton) {
        
        if CMAltimeter.isRelativeAltitudeAvailable(){
            
            self.altimetro.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: { (data, error) in
                
                self.labelRelativeAltitude.text = "\(data!.relativeAltitude)m"
                self.labelPressure.text = "\(data!.pressure) kPA"
                
            })
            
        }
        
    }
    
}

