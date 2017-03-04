//
//  ViewController.swift
//  Swift300_Day7_3_NSNotificationCenter
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var labelUnica: UILabel!
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.funcaoDisparadaPelaNotificacao(_:)), name: NSNotification.Name(rawValue: "NOTIFICACAO"), object: nil)
        
    }
    
    // MARK: - Methods
    
    func funcaoDisparadaPelaNotificacao(_ notificacao : Notification) {
        
        self.labelUnica.text = "Funfou"
        
        print(notificacao.userInfo)
        
    }
    
    // MARK: - Actions
    
}
