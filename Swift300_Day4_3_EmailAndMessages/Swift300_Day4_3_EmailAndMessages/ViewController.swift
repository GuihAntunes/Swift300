//
//  ViewController.swift
//  Swift300_Day4_3_EmailAndMessages
//
//  Created by Swift on 04/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
// Importando o Framework ao projeto
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    
    // MARK: - Actions
    @IBAction func sendEmail(_ sender: Any) {
        
        // Verificando se o usuário pode enviar e-mails
        if (MFMailComposeViewController.canSendMail()) {
            
            // Caso possa
            
            // Criando o nosso objeto responsável pela criação do nosso e-mail
            
            let mailCompose = MFMailComposeViewController()
            
            // Fazendo o preenchimento dos campos do e-mail
            
            // Método que define o objeto responsável pelo assunto do e-mail
            
            mailCompose.setSubject("Interesse na vaga aberta")
            
            // Método que define o corpo do e-mail
            mailCompose.setMessageBody("<strong><i> Boa tarde, gostaria de me candidatar a vaga de diretor da Apple. Soube que recentemente ficou vaga por motivos de força maior e que o atual diretor não está indo muito bem! </i></strong>", isHTML: true)
            
            // Método que define os destinatários
            let arrayDestinatarios = ["hr@apple.com", "workwithus@apple.com", "recruitment@apple.com"]
            mailCompose.setToRecipients(arrayDestinatarios)
            
            // Método que define quem estará em cópia do e-mail
            let arrayCopia = ["zuck@face.com", "bill@microsoft.com", "tim@bolachaoubiscoito.com"]
            mailCompose.setCcRecipients(arrayCopia)
            
            // Método que define quem estará em cópia oculta
            let arrayCopiaOculta = ["edwardsnooden@nsa.com", "baidu@baidu.com"]
            mailCompose.setBccRecipients(arrayCopiaOculta)
            
            // Anexando um arquivo (utilizando Mime Type)
            let imageData = UIImagePNGRepresentation(UIImage(named: "foto.png")!)!
            mailCompose.addAttachmentData(imageData, mimeType: "image/png", fileName: "ScreenShot")
            
            self.present(mailCompose, animated: true, completion: nil)
            
            
        }else{
            
            // Caso não possa
            // Refactor this
            let alert = UIAlertController(title: "Alerta!", message: "Não é possível enviar e-mails no momento!", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(acaoOK)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }

    @IBAction func sendMessage(_ sender: Any) {
        
        // Verificação se é possível fazer o envio da mensagem
        if MFMessageComposeViewController.canSendText() {
            
            // Caso seja possível
            
            // Criamos um objeto da classe responsável por escrever mensagens
            let messageCompose = MFMessageComposeViewController()
            
            // Propriedade que define o corpo da mensagem
            messageCompose.body = "E aí jovem, bão?"
            
            // Atribuindo o delegate
            messageCompose.messageComposeDelegate = self
            
        }else{
            
            // Caso não seja possível
            // Refactor this
            let alert = UIAlertController(title: "Alerta!", message: "Não é possível enviar mensagens no momento!", preferredStyle: .alert)
            
            let acaoOK = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(acaoOK)
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - MFMailComposeViewControllerDelegate Methods
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .cancelled:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Cancelado!", message: "Envio cancelado!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)

        case .sent:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Enviado!", message: "E-mail enviado!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
        case .failed:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Falhou!", message: "Falha no envio! Tente novamente", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
        case .saved:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Salvo!", message: "E-mail salvo!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
        }
        
        
        
    }
    
    // MARK: - MFMessageComposeViewControllerDelegate Methods
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
        switch result {
        case .cancelled:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Cancelado!", message: "Envio cancelado!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
        case .failed:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Errrrooou!", message: "Falha no envio! Tente novamente mais tarde", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
        case .sent:
            controller.dismiss(animated: true, completion: nil)
            // Refactor this
            let alert = UIAlertController(title: "Enviada!", message: "Mensagem enviada!", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
        }
        
    }
    
    
}

