//
//  ViewController.swift
//  Swift300_Day7_2_UIActivityViewController
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var textFieldURL: UITextField!
    @IBOutlet weak var textFieldTexto: UITextField!
    
    // MARK: - Properties
    
    var minhaActivity:UIActivityViewController!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    func exibeAlertaSimples(titulo : String, mensagem: String) {
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(acaoOk)
        
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    // MARK: - Actions
    @IBAction func enviarUrl(_ sender: UIButton) {
        
        if !self.textFieldURL.text!.isEmpty {
            
            let url = URL(string: self.textFieldURL.text!)
            
            self.minhaActivity = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
            
            self.present(self.minhaActivity, animated: true, completion: nil)
            
        }else{
            
           self.exibeAlertaSimples(titulo: "Alerta", mensagem: "Preencha corretamente o campo da URL para prosseguir")
            
        }
        
    }
    
    @IBAction func enviarTexto(_ sender: UIButton) {
        
        if !self.textFieldTexto.text!.isEmpty {
            
            self.minhaActivity = UIActivityViewController(activityItems: [self.textFieldTexto.text!], applicationActivities: nil)
            
            self.present(minhaActivity, animated: true, completion: nil)
            
        }else{
            
            self.exibeAlertaSimples(titulo: "Alerta!", mensagem: "Preencha corretamente o campo de texto para fazer o compartilhamento")
            
        }
        
    }
    
    @IBAction func enviarImagem(_ sender: UIButton) {
        
        let caminho = Bundle.main.path(forResource: "Quaddro Swift", ofType: "png")
        
        let url = URL(fileURLWithPath: caminho!)
        
        self.minhaActivity = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        self.present(minhaActivity, animated: true, completion: nil)
        
    }
}
