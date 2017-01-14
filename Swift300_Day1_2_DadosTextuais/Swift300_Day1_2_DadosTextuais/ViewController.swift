//
//  ViewController.swift
//  Swift300_Day1_2_DadosTextuais
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     
     É possível salvar dados textuais diretamente em disco para processamento futuro, este recurso se torna particularmente útil quando é necessário uma persistência na aplicação
     
     */
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let caminhoParaSandBox = NSHomeDirectory()
        
        let pathDocuments = (caminhoParaSandBox as NSString)
        
        let pathArquivo = (pathDocuments as NSString).appendingPathComponent("arquivo.txt")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

