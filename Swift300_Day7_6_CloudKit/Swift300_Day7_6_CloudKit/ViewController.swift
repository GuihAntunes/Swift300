//
//  ViewController.swift
//  Swift300_Day7_6_CloudKit
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var sobrenome: UITextField!
    
    // MARK: - Properties
    
    let database = CKContainer.default().publicCloudDatabase
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func cadastrar(_ sender: UIButton) {
        
        if !self.nome.text!.isEmpty || !self.sobrenome.text!.isEmpty {
            
            let nome = self.nome.text!
            let sobrenome = self.sobrenome.text!
            
            let aluno = CKRecord(recordType: "Aluno")
            
            aluno.setObject(nome as CKRecordValue, forKey: "Nome")
            
            // Key criada no CloudKit Dashboard
            aluno.setObject(sobrenome as CKRecordValue, forKey: "Sobrenome")
            
            self.database.save(aluno, completionHandler: { (record, error) in
                
                if error != nil {
                    
                    print("Deu erro ao salvar!")
                    
                }else{
                    
                    self.nome.text = ""
                    self.sobrenome.text = ""
                    
                    print("Dado Salvo")
                    
                }
                
            })
            
        }else{
            
            
            
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
        
        // Criando a query que iremos utilizar
        let query = CKQuery(recordType: "Aluno", predicate: NSPredicate(value: true))
        
        // Executando a Query
        self.database.perform(query, inZoneWith: nil) { (retorno, erro) in
            
            if erro != nil {
                
                if retorno != nil {
                    
                    // Fazendo um for para resgatar o retorno
                    
                    for aluno in retorno!{
                        
                        print("\(aluno.value(forKey: "Nome"))")
                        print("\(aluno.value(forKey: "Sobrenome"))")
                        print("\n")
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    @IBAction func resgatarEspecifica(_ sender: UIButton) {
        
        // Criando a query que iremos utilizar
        let query = CKQuery(recordType: "Aluno", predicate: NSPredicate(format: "nome BEGINSWITH 'Fe'"))
        
        // Executando a Query
        self.database.perform(query, inZoneWith: nil) { (retorno, erro) in
            
            if erro != nil {
                
                if retorno != nil {
                    
                    // Fazendo um for para resgatar o retorno
                    
                    for aluno in retorno!{
                        
                        print("\(aluno.value(forKey: "Nome"))")
                        print("\(aluno.value(forKey: "Sobrenome"))")
                        print("\n")
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

