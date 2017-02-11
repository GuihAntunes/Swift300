//
//  ViewController.swift
//  Swift300_Day5_2_JSON
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // refactor this
        let urlJson = Bundle.main.url(forResource: "arquivo", withExtension: "json")!
        
        let jsonData : Data = try!  Data(contentsOf: urlJson)
        
        do {
            let jsonParse = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [[String : String]]
            
            print(jsonParse)
        
        }catch{}
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    
}
