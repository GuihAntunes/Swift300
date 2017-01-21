//
//  ViewController.swift
//  Swift300_Day3_3_Quicklook
//
//  Created by Swift on 21/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
// Importante o framework
import QuickLook

// Adotando os protocolos de QLPreviewControllerDataSource e QLpreviewControllerDelegate
class ViewController: UIViewController, QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!

    // MARK: - Propriedades
    
    var arrayNomesFotos : [String] = []

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.populaArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    private func populaArray() {
        
        for i in 1...20{
            
            let nomeFoto = "IMG_\(i)"
            
            self.arrayNomesFotos += [nomeFoto]
            
        }
        
        print(self.arrayNomesFotos)
        
    }
    
    // MARK: - Actions
    @IBAction func escolher(_ sender: AnyObject) {
        
        let quickLook = QLPreviewController()
        
        // Atribuindo os dataSource e delegates
        quickLook.dataSource = self
        quickLook.delegate = self
        
        self.present(quickLook, animated: true, completion: nil)
        
    }
    
    // MARK: - Métodos de QLPreviewControllerDataSource
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        
        return self.arrayNomesFotos.count
        
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        // Criando o nome do arquivo baseado no objeto do nosso array que contém os nomes e o índice do nosso método.
        
        let nomeFoto = self.arrayNomesFotos[index]
        
        // Criando o caminho até a raiz
        let raizApp = Bundle.main
        
        // Criando o caminho até o arquivo específico
        let pathArquivo = raizApp.path(forResource: nomeFoto, ofType: ".JPG")
        
        // Convertendo o caminho que está em String em uma URL
        let urlArquivo = URL(fileURLWithPath: pathArquivo ?? "")
        
        // Retornando a URL que contém o endereço
        return urlArquivo as QLPreviewItem
        
    }
    
    // MARK: - Métodos de QLPreviewControllerDelegate
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        
        // Resgatando o eindice da seleção
        let indice = controller.currentPreviewItemIndex
        
        // Criando o nome do arquivo baseado no índice e em nosso array
        let nomeImagem = self.arrayNomesFotos[indice]
        
        print("\nNOME: \(nomeImagem)\n")
        
        // Criando o nome completo da nossa imagem
        let nomeCompleto = nomeImagem + ".JPG"
        
        // Exibindo em tela
        self.imageView.image = UIImage(named: nomeCompleto)
        
    }
    
}

