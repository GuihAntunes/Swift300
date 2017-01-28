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
        
        self.isSelecting = false
        
        let contactPicker = CNContactPickerViewController()
        
        contactPicker.delegate = self
        
        self.nome.text = ""
        
        self.sobrenome.text = ""
        
        self.telefone.text = ""
        
        self.present(contactPicker, animated: true, completion: nil)
        
    }
    @IBAction func novoContato(_ sender: AnyObject) {
        
        let alerta = UIAlertController(title: "Criar Contato", message: "Insira os dados para criar um novo contato", preferredStyle: .alert)
        
        let acaoOk = UIAlertAction(title: "Ok", style: .default) { (acao) in
            
            // Fix this forced unwrap
            let nome = alerta.textFields![0].text
            let sobrenome = alerta.textFields![1].text
            let telefone = alerta.textFields![2].text
            
            if !(nome!.isEmpty || sobrenome!.isEmpty || telefone!.isEmpty) {
                
                // Criando um novo contato
                let novoContato = CNMutableContact()
                
                novoContato.givenName = nome!
                novoContato.familyName = sobrenome!
                novoContato.phoneNumbers = [CNLabeledValue(label:"home", value: CNPhoneNumber(stringValue: telefone!))]
                
                let contactStore = CNContactStore()
                let saveRequest = CNSaveRequest()
                
                saveRequest.add(novoContato, toContainerWithIdentifier: nil)
                
                try? contactStore.execute(saveRequest)
                
            }else{
                
                // Caso esteja vazio
                
                let alerta = UIAlertController(title: "Alerta", message: "Preencha todos os campos!", preferredStyle: .alert)
                
                let acaoOk2 = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alerta.addAction(acaoOk2)
                
                self.present(alerta, animated: true, completion: nil)
                
            }
            
        }
        
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(acaoOk)
        alerta.addAction(acaoCancelar)
        alerta.addTextField { (textField) in
            textField.placeholder = "Nome"
        }
        alerta.addTextField { (textField) in
            textField.placeholder = "Sobrenome"
        }
        alerta.addTextField { (textField) in
            textField.placeholder = "Telefone"
        }
        
        self.present(alerta, animated: true, completion: nil)
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
            let saveRequest = CNSaveRequest()
            let contatoParaDeletar = contact.mutableCopy() as! CNMutableContact
            saveRequest.delete(contatoParaDeletar)
            
            do{
            
                try contactStore.execute(saveRequest)
            
            }catch{}
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        picker.dismiss(animated: true, completion: nil)
    }
    

}

