//
//  ViewController.swift
//  DesafioCompartilhaPosicao
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import MessageUI

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var latlongLabel: UILabel!
    
    // MARK: - Properties

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func trackPosition(_ sender: UIBarButtonItem) {
        
        
        
    }
    @IBAction func sharePositionWithEmail(_ sender: UIBarButtonItem) {
        
        
        
    }

}

