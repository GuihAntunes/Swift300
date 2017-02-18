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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func start(_ sender: UIButton) {
        
        
        
    }
    
}

