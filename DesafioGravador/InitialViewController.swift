//
//  InitialViewController.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    // MARK: - Outlets
    @IBOutlet weak var myTableView: UITableView!
        
    // MARK: - Properties
    var dictionaryOfRecords : Dictionary <String, URL> = [:]
    
    let titles = ["Novas Gravações", "Consultas", "Exclusões"]
    
    let rowsTexts = ["Criar uma nova gravação", "Gravações Salvas", "Excluir todas as gravações"]
        
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
            
    }
        
    // MARK: - Methods
        
    // MARK: - Actions
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "initialCell", for: indexPath)
        
        cell.textLabel?.text = rowsTexts[indexPath.section]
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let headerText = titles[section]
        
        return headerText
        
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            self.performSegue(withIdentifier: "newRecordSegue", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "recordsFilesSegue", sender: nil)
        case 2:
            
            if FileManager.default.fileExists(atPath: recordsFilePath){
                
                self.dictionaryOfRecords = NSDictionary(contentsOfFile: recordsFilePath) as! Dictionary<String, URL>
                
                let eraseAlert = UIAlertController(title: "Esta ação não pode ser revertida", message: "Deseja apagar todos os dados", preferredStyle: .actionSheet)
                
                let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                
                let okAction = UIAlertAction(title: "Ok", style: .destructive, handler: { (acao) in
                    
                    // TODO: Exclude all records
                    
                })
                
                eraseAlert.addAction(okAction)
                eraseAlert.addAction(cancelAction)
                
                self.present(eraseAlert, animated: true, completion: nil)
                
            }else{
                
                let alert = UIAlertController(title: "Alerta!", message: "Não há gravações para serem apagadas.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true, completion: nil)
                
            }
            
        default:
            break
        }
        
    }
    
    

}
