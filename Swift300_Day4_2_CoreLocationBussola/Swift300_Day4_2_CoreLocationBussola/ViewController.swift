//
//  ViewController.swift
//  Swift300_Day4_2_CoreLocationBussola
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var needleView: UIView!
    
    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        self.locationManager.delegate = self
        
        locationManager.startUpdatingHeading()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    
    
    // MARK: - Actions
    
    // MARK: - CLLocationManagerDelegate Methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        // Resgatando o ângulo baseado no norte
        let angle = newHeading.magneticHeading
        let radianus = angle * M_PI / 180
        
        self.needleView.transform = CGAffineTransform(rotationAngle: CGFloat(radianus))
        
    }


}

