//
//  ViewController.swift
//  Swift300_Day7_4_LocalNotification
//
//  Created by Swift on 04/03/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var meuDate: UIDatePicker!
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (accepted, error) in
            
            if !accepted {
                
                print("Acesso a notificação foi negado")
                
            }
            
        }
        
        UNUserNotificationCenter.current().delegate = self
        
        
        
    }
    
    // MARK: - Methods
    
    func dispararNotificacao(na data : Date) {
        
        // Gatilho da notificação
        let gatilho = UNCalendarNotificationTrigger(dateMatching: data.paraDateComponents, repeats: false)
        
        // Conteúdo da notificação
        let conteudo = UNMutableNotificationContent()
        conteudo.title = "Notificação Local"
        conteudo.body = "Notificação local funcionando"
        conteudo.sound = UNNotificationSound.default()
        
        conteudo.categoryIdentifier = "myCategory"
        
        // Criando o botão da notificação
        let action = UNNotificationAction(identifier: "relembrar", title: "Me lembrar mais tarde", options: [])
        
        let category = UNNotificationCategory(identifier: "myCategory", actions: [action], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        // Requisição da notificação
        let requisicao = UNNotificationRequest(identifier: "textNotification", content: conteudo, trigger: gatilho)
        
        // Remove as notificações pendentes
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        // Adicionando a notificação
        UNUserNotificationCenter.current().add(requisicao, withCompletionHandler: nil)
        
    }
    
    // MARK: - Actions
    @IBAction func mudarData(_ sender: UIDatePicker) {
        
        let dataSelecionada = sender.date
        self.dispararNotificacao(na: dataSelecionada)
        
    }
    
    // MARK: - UNNotificationCenterDelegate
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
        if response.actionIdentifier == "relembrar"{
            
            let novaData = Date(timeInterval: 61.0, since: Date())
            
            self.dispararNotificacao(na: novaData)
            
        }
    }
    
}

// Conversor de Date para DateComponents
extension Date {
    
    var paraDateComponents : DateComponents{
        
        let calendario = Calendar(identifier: .gregorian)
        
        let components = calendario.dateComponents(in: .current, from: self)
        
        let novosComponentes = DateComponents(calendar: calendario, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        
        return novosComponentes
        
    }
    
}


