//
//  TabelaViewController.swift
//  DesafioXML
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class TabelaViewController: UITableViewController, MyParserDelegate {
   
    // MARK: - Outlets
        
    // MARK: - Properties
    
    var array : [Dictionary<String,String>] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myParser = MyParser()
        
        myParser.delegate = self
        
        myParser.initiateParse()
        
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
            
    }
        
    // MARK: - Methods
        
    // MARK: - Actions
    
    // MARK: - UITableViewDataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.studentName.text = self.array[indexPath.row]["nome"]
        
        cell.studentAge.text = self.array[indexPath.row]["idade"]
        
        return cell
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.array.count
        
    }
    
    // MARK: - MyParserDelegate Method
    
    func myParserAlreadyFinished(_ result: [Dictionary<String, String>]) {
        
        self.array = result
        self.tableView.reloadData()
        
    }

}
