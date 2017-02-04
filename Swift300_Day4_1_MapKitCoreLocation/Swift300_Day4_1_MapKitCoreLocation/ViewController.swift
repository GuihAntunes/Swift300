//
//  ViewController.swift
//  Swift300_Day4_1_MapKitCoreLocation
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var map: MKMapView!

    // MARK: - Properties
    
    var gpsManager = CLLocationManager()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.gpsManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Criando as coordenadas geográficas de um de nossos pontos no mapa
        let coordenadasLasVegas = CLLocationCoordinate2D(latitude: 36.160406, longitude: -115.170888)
        
        // Criando o span
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        // Criando a região que será exibida inicialmente em nosso mapa
        let regiao = MKCoordinateRegion(center: coordenadasLasVegas, span: span)
        
        // Efetivamente colocando o mapa na região desejada
        self.map.setRegion(regiao, animated: true)
        
        // Criando pinos em nosso mapa
        
        let pinoLasVegas = MKPointAnnotation()
        let pinoPuntaDelEste = MKPointAnnotation()
        
        // Atribuindo a propriedade que define o título
        
        pinoLasVegas.title = "Las Vegas"
        pinoPuntaDelEste.title = "Punta del Este"
        
        // Propriedade que define a coordenada
        
        pinoPuntaDelEste.coordinate = CLLocationCoordinate2D(latitude: -34.968396, longitude: -54.951185)
        pinoLasVegas.coordinate = coordenadasLasVegas
        
        // Método que seta o pino no mapa
        
        self.map.addAnnotation(pinoLasVegas)
        self.map.addAnnotation(pinoPuntaDelEste)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func changeMap(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.map.mapType = .standard
        case 1:
            self.map.mapType = .satellite
        case 2:
            self.map.mapType = .hybrid
        default:
            self.map.mapType = .standard
        
        }
    }
    @IBAction func locate(_ sender: UIBarButtonItem) {
        
        // Verificando se há autorização
        
        if( CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse && CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedAlways){
            //  Caso não tenhamos autorização
            
            // Solicitamos ao sistema que requisite a nossa autorização
            self.gpsManager.requestWhenInUseAuthorization()
            
            
            
        }
        
        // Atribuindo o delegate
        
        self.gpsManager.delegate = self
        
        // Propriedade que liga o rastremaneto do usuário
        self.map.showsUserLocation = true
        
        
        // Iniciando o processode verificação
        self.gpsManager.startUpdatingLocation()
        
    }

    
    // MARK: - CLLocationManagerDelegate Methods

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations.last as Any)
        
        // Resgatando a localização
        
        let location = locations.last
        
        // Criando o span
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        // Criando a região que usaremos para setar no mapa
        
        let region = MKCoordinateRegion(center: location!.coordinate, span: span)
        
        self.map.setRegion(region, animated: true)
        
    }
    


}

