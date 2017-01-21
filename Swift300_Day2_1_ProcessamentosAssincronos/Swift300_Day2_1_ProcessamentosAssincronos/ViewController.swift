//
//  ViewController.swift
//  Swift300_Day2_1_ProcessamentosAssincronos
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var labelCima: UILabel!
    
    @IBOutlet weak var labelBaixo: UILabel!
    
    // MARK: - Propriedades
    
    // MARK: - View Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    
    @IBAction func iniciar(_ sender: AnyObject) {
        
        DispatchQueue.global().async {
        
            for i in 1...10{
            
                self.labelCima.text = "\(i)"
            
                Thread.sleep(forTimeInterval: 1.0)
            
            }
            
        }
        
        //
        
        for i in 1...10{
            
            self.labelBaixo.text = "\(i)"
            
            Thread.sleep(forTimeInterval: 1.0)
            
        }
        
    }

}

