//
//  ViewController.swift
//  Swift300_Day3_2_Contatos
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
// Importing frameworks
import Contacts
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var sobrenome: UILabel!
    @IBOutlet weak var telefone: UILabel!
    
    // MARK: - Properties
    
    var contactStore = CNContactStore()
    var isSelecting = true
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Solicitando autorização para acessar os contatos
        if(CNContactStore.authorizationStatus(for: CNEntityType.contacts) != CNAuthorizationStatus.authorized){
            
            self.contactStore.requestAccess(for: CNEntityType.contacts, completionHandler: { (autorizacao, erro) in
                
                print("Solicitação")
                
            })
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func selecionar(_ sender: AnyObject) {
        
        // Tratando a variável de controle
        self.isSelecting = true
        
        let contactPicker = CNContactPickerViewController()
        
        contactPicker.delegate = self
        
        self.present(contactPicker, animated: true, completion: nil)
        
    }
    @IBAction func apagar(_ sender: AnyObject) {
        
        
        
    }
    @IBAction func novoContato(_ sender: AnyObject) {
        
        
        
    }

    // MARK: - CNContactPickerDelegate Methods
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        
        // Verificando se o usuário quer apagar ou selecionar um contato
        if (self.isSelecting){
            
            // caso ele queira selecionar
            let nome = contact.givenName
            let sobrenome = contact.familyName
            
            var telefone = ""
            let telefones = contact.phoneNumbers
            
            if telefones.count > 0 {
                
                telefone = (telefones[0].value).stringValue
                
            }
            
            // Exibindo os dados na label
            
            self.nome.text = nome
            self.sobrenome.text = sobrenome
            self.telefone.text = telefone
            
        }else{
            
            // caso ele queira apagar
            
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        picker.dismiss(animated: true, completion: nil)
    }
    

}

