//
//  ViewController.swift
//  DesafioMapKit
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import MapKit

// Coordenadas Oiapoque = 3.360750, -52.146150
// Coordenadas Chuí = -33.686084, -53.428177

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var map: MKMapView!
    
    // MARK: - Properties
    
    let chuiCoordinates = CLLocationCoordinate2D(latitude: -33.686084, longitude: -53.428177)
    
    let oiapoqueCoordinates = CLLocationCoordinate2D(latitude: 3.360750, longitude: -52.146150)
    
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    
    var gpsManager = CLLocationManager()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gpsManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let region = MKCoordinateRegion(center: oiapoqueCoordinates, span: span)
        
        self.map.setRegion(region, animated: true)
        
        let oiapoquePin = MKPointAnnotation()
        
        let chuiPin = MKPointAnnotation()
        
        oiapoquePin.title = "Oiapoque"
        
        chuiPin.title = "Chuí"
        
        oiapoquePin.coordinate = oiapoqueCoordinates
        
        chuiPin.coordinate = chuiCoordinates
        
        self.map.addAnnotation(oiapoquePin)
        
        self.map.addAnnotation(chuiPin)
        
        
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
        
        let region = MKCoordinateRegion(center: chuiCoordinates, span: span)
        
        self.map.setRegion(region, animated: true)
        
    }
    @IBAction func changeToOiapoque(_ sender: UIBarButtonItem) {
        
        let region = MKCoordinateRegion(center: oiapoqueCoordinates, span: span)
        
        self.map.setRegion(region, animated: true)
        
    }
    
    
    


}

