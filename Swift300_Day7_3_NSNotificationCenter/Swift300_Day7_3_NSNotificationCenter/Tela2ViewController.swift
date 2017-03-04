//
//  Tela2ViewController.swift
//  Swift300_Day7_3_NSNotificationCenter
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {
        
    // MARK: - Outlets
    
    // MARK: - Properties
        
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
            
    }
        
    // MARK: - Methods
        
    // MARK: - Actions
    @IBAction func dispararNotificacao(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NOTIFICACAO"), object: nil, userInfo: ["nome" : "Felipe", "sobrenome" : "Smith"])
        
        self.dismiss(animated: true, completion: nil)
        
    }
        
}
