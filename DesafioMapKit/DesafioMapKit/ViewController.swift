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
    
    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    var gpsManager = CLLocationManager()
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gpsManager.desiredAccuracy = kCLLocationAccuracyBest
        
        let region = MKCoordinateRegion(center: oiapoqueCoordinates, span: span)
        
        self.map.setRegion(region, animated: true)
        
        setPin(coordinates: oiapoqueCoordinates, title: "Oiapoque")
        
        setPin(coordinates: chuiCoordinates, title: "Chuí")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    func setPin(coordinates:CLLocationCoordinate2D, title:String) {
        
        let pin = MKPointAnnotation()
        pin.title = title
        pin.coordinate = coordinates
        self.map.addAnnotation(pin)
        
    }
    
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
        
        let regionChui = MKCoordinateRegion(center: chuiCoordinates, span: span)
        self.map.setRegion(regionChui, animated: true)
        
    }
    @IBAction func changeToOiapoque(_ sender: UIBarButtonItem) {
        
        let regionOiapoque = MKCoordinateRegion(center: oiapoqueCoordinates, span: span)
        self.map.setRegion(regionOiapoque, animated: true)
        
    }

}

