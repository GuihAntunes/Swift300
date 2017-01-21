//
//  ViewController.swift
//  DesafioGCD
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    // MARK: - Propriedades
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.isEditable = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func calcular(_ sender: AnyObject) {
        
        self.textView.text = ""
        
        DispatchQueue.global().async {
            
            if let num = Int(self.textField.text ?? ""){
                
                for i in 1...10{
                    
                    DispatchQueue.main.async {
                        
                        self.textView.text = self.textView.text + "\(num) x \(i) = \(num * i)\n"
                        
                    }
                    
                    Thread.sleep(forTimeInterval: 1.0)
                }
            }
        }
        
    }
    
}

