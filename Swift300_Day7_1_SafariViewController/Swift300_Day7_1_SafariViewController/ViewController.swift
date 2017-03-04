//
//  ViewController.swift
//  Swift300_Day7_1_SafariViewController
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
// Framework
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func abrirSafariViewController(_ sender: UIButton) {
        
        let meuSafariViewController = SFSafariViewController(url: URL(string: "http://www.google.com.br")!)
        
        self.present(meuSafariViewController, animated: true, completion: nil)
        
        meuSafariViewController.delegate = self
        
    }
    
    // MARK: - SFSafariViewControllerDelegate Methods
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
    
        print("Did Finish")
    
    }
    
    func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        
        print("Carregamento inicial concluído")
        
    }
    
}

