//
//  ViewController.swift
//  Swift300_Day1_5_GCD
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* GCD
         
         Nos permite a utilização de recursos avançados de subprocessamento. Possui recursos para divisão de processos em múltiplos núcleos.
         
         Terminologias:
         
         Queue: Fila de execução de tarefas
         - main_queue: Concentra os recursos principais da sua aplicação
         - global_queue: Espaço reservado para processamentos secundários
         
         Sync: Define uma execução síncrona, não permite blocos simultâneos
         Async: Define uma execução assíncrona, permite blocos simultâneos
         
         */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    
    @IBAction func processsarLinhaPrincipal(_ sender: AnyObject) {
        
        for _ in 1...10{
            
            print("Processando!")
            
            Thread.sleep(forTimeInterval: 1.0)
            
        }
        
    }
    
    @IBAction func processarGCD(_ sender: AnyObject) {
        
        DispatchQueue.global().async {
            
            for _ in 1...10{
                
                print("Processando!")
                
                Thread.sleep(forTimeInterval: 1.0)
                
            }
            
        }
        
    }
}

