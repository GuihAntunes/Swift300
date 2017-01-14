//
//  ViewController.swift
//  Swift300_Day1_3_Arrays_Dicionarios
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         
         Trabalhando com array e dictionary
         
         Uma property list é um arquivo que pode salvar informações estruturadas no formato de dictionary ou array.
         
         Property lists podem ser constituídas apenas de certos tipos de daos como dicionarios, arrays, strings, números, datas (Date), dados binários (Data), valores booleanos.
         
         Não é possível salvar (inicialmente) dados complexos em um plist, caso haja a necessidade você pode salvar apenas as propriedades e porteriormente recriar suas instâncias.
         
         */
        
        // Criando o path onde o arquivo será salvo
        
        let caminhoParaSandBox = NSHomeDirectory()
        
        let pathDocuments = (caminhoParaSandBox as NSString).appendingPathComponent("Documents")
        
        print(pathDocuments)
        
        // =================================== Salvando arrays ========================================
        
        // Criando o path onde o arquivo será salvo
        
        let pathArraySalvo = (pathDocuments as NSString).appendingPathComponent("array.plist")
        
        // Criando o array com os valores que serão salvos
        let arrayNome = ["Felipe", "Filisbina", "Garibaldo"]
        
        // Realizando a gravação em disco
        
        let arrayConvertido = arrayNome as NSArray
        
        arrayConvertido.write(toFile: pathArraySalvo, atomically: true)
        
        // =================================== Resgatando o elemento salvo ===================================
        
        let arrayResgatado = NSArray(contentsOfFile: pathArraySalvo)
        
        print("\n\n\nArray Resgatado: \(arrayResgatado)\n\n\n")
        
        // =================================== Salvando Dicionários =========================================
        
        // Criando o path até o elemento
        
        let pathDicionarioSalvo = (pathDocuments as NSString).appendingPathComponent("dicionario.plist")
        
        // Criando o dicionário que será salvo em disco
        
        let dicionario = [
            
            "nome" : "Guilherme",
            "sobrenome" : "Antunes"
            
        ]
        
        // Realizando a gravação em disco
        
        let dicionarioConvertido = dicionario as NSDictionary
        
        dicionarioConvertido.write(toFile: pathDicionarioSalvo, atomically: true)
        
        // =================================== Resgatando o dicionário ========================================
        
        let dicionarioResgatado = NSDictionary(contentsOfFile: pathDicionarioSalvo)
        
        print("\n\n\n\(dicionarioResgatado)\n\n\n")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

