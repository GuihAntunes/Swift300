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

// Latitude e longitude iniciais = -23.565811, -46.652478

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var latlongLabel: UILabel!
    
    // MARK: - Properties
    
    var gpsManager = CLLocationManager()
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialCoordinates = CLLocationCoordinate2D(latitude: -23.565811, longitude: -46.652478)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        let initialRegion = MKCoordinateRegion(center: initialCoordinates, span: span)
        
        self.map.setRegion(initialRegion, animated: true)
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse){
            
            self.gpsManager.requestWhenInUseAuthorization()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func trackPosition(_ sender: UIBarButtonItem) {
        
        self.gpsManager.delegate = self
        
        self.map.showsUserLocation = true
        
        self.gpsManager.startUpdatingLocation()
        
    }
    
    @IBAction func sharePositionWithEmail(_ sender: UIBarButtonItem) {
        
        
        
    }
    
    // MARK: - CLLocationManagerDelegate Methods

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            
            self.map.setRegion(region, animated: true)
            
        }
        
        

        
    }
    
}

