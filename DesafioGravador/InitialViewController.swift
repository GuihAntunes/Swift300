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
            print("To do the exclusion method!")
        default:
            break
        }
        
    }

}
