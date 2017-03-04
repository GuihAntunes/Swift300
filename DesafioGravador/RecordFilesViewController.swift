//
//  RecordFilesViewController.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class RecordFilesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    var dictionaryOfFiles : NSDictionary = [:]
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FileManager.default.fileExists(atPath: recordsFilePath){
            
            // Unwrap this
            self.dictionaryOfFiles = NSDictionary(contentsOfFile: recordsFilePath)!
            
        }else{
            
            let alert = UIAlertController(title: "Alerta", message: "Não há gravações salvas", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    // MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueTelaReproducao" {
            
            let targetViewController = segue.destination as! RecordDetailViewController
            
            targetViewController.chosenFile = sender as? String
            
        }
        
    }
    
    // MARK: - Actions
    
    // MARK: - UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordFilesCell", for: indexPath)
        
        cell.textLabel?.text = "Teste"
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dictionaryOfFiles.count
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recordName = self.dictionaryOfFiles[indexPath.row]
        
        self.performSegue(withIdentifier: "segueTelaReproducao", sender: recordName)
        
    }
    
}
