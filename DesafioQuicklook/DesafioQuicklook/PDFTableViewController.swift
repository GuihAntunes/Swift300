//
//  PDFTableViewController.swift
//  DesafioQuicklook
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import QuickLook
import UIKit

class PDFTableViewController: UITableViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {

    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    var arrayNomePdf:[String] = ["5_Conselhos", "Identdade da Sua Empresa", "Marketing Digital"]
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    
    // MARK: - Métodos de TableViewDataSource
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pdfcell", for: indexPath)
        
        cell.textLabel?.text = self.arrayNomePdf[indexPath.row]
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayNomePdf.count
    }
    
    // MARK: - Métodos de TableViewDelegate

    // MARK: - Métodos de QLPreviewControllerDataSource
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.arrayNomePdf.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        let nomePDF = self.arrayNomePdf[index]
        
        let raizApp = Bundle.main
        
        let pathArquivo = raizApp.path(forResource: nomePDF, ofType: ".pdf")
        
        let urlArquivo = URL(fileURLWithPath: pathArquivo ?? "")
        
        return urlArquivo as QLPreviewItem
        
    }

}
