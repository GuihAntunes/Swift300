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

class ViewController: UIViewController, CLLocationManagerDelegate, MFMailComposeViewControllerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var latlongLabel: UILabel!
    
    // MARK: - Properties
    
    var gpsManager = CLLocationManager()
    
    var actualLat = 0.0
    
    var actualLong = 0.0
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialCoordinates = CLLocationCoordinate2D(latitude: -23.565811, longitude: -46.652478)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        let initialRegion = MKCoordinateRegion(center: initialCoordinates, span: span)
        
        self.map.setRegion(initialRegion, animated: true)
            
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedAlways) {
            
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
        
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedAlways) {
            
            self.gpsManager.requestWhenInUseAuthorization()
            
        }
            self.gpsManager.delegate = self
            
            self.map.showsUserLocation = true
            
            self.gpsManager.startUpdatingLocation()
        
    }
    
    @IBAction func sharePositionWithEmail(_ sender: UIBarButtonItem) {
  
        if (MFMailComposeViewController.canSendMail()) {
            
            let mailCompose = MFMailComposeViewController()
            
            mailCompose.setSubject("Ei estou aqui")
            
            mailCompose.setMessageBody("<strong><i> Estou na latitude: \(self.actualLat) e na longitude: \(self.actualLong)</i></strong>", isHTML: true)
            
            let arrayMailTo = ["brother@gmail.com", "jovem@gmail.com", "outrojovem@gmail.com"]
            
            mailCompose.setToRecipients(arrayMailTo)
            
        }else{
            
            let alert = UIAlertController(title: "Alerta!", message: "Não é possível enviar e-mails neste momento. Boa sorte aí brother!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    // MARK: - CLLocationManagerDelegate Methods

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            
            self.actualLat = location.coordinate.latitude
            
            self.actualLong = location.coordinate.longitude
            
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            
            self.latlongLabel.text = "Lat: \(location.coordinate.latitude) Long: \(location.coordinate.longitude)"
            
            self.map.setRegion(region, animated: true)
            
        }

    }
    
    
    // MARK: - MFMailComposeViewControllerDelegate Methods
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .sent:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "E-mail enviado!", message: "Aguenta que o brother tá vinu!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
        case .saved:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "E-mail salvo!", message: "Vai esperar pra pedir ajuda pro brother memo, tá certo!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Vou sim", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
        case .failed:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Alerta!", message: "Não rolou pedir ajuda. Boa sorte aí brother!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
        case .cancelled:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Boa mlk!", message: "Já se achou né jovem? Monstro!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
}
