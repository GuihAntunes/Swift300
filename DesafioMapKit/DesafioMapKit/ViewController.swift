//
//  ViewController.swift
//  DesafioMapKit
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var map: MKMapView!
    
    // MARK: - Properties
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func mapType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.map.mapType = .standard
        case 1:
            self.map.mapType = .satellite
        default:
            self.map.mapType = .standard
        }
        
    }
    @IBAction func changeToChui(_ sender: UIBarButtonItem) {
        
        
        
    }
    @IBAction func changeToOiapoque(_ sender: UIBarButtonItem) {
        
        
        
    }
    
    
    


}

