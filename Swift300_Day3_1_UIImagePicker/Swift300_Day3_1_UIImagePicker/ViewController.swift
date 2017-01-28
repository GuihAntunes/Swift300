//
//  ViewController.swift
//  Swift300_Day3_1_UIImagePicker
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit



// Adotando o protocolo UIImagePickerControllerDelegate e UINavigationControllerDelegate
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var imageViewAlbum: UIImageView!
    @IBOutlet weak var imageViewDocuments: UIImageView!
    
    // MARK: - Properties
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(pathDocuments)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func abrirAlbum(_ sender: AnyObject) {
        
        // Iniciando uma instância de ImagePickerController
        let imagePicker = UIImagePickerController()
        
        // Atribuindo o delegate
        imagePicker.delegate = self
        
        // Verificando se o sourceType está disponível
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
            // Caso o sourceType esteja disponível
            
            // Atribuindo o sourceType
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            // Apresentando o picker em tela
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            // Caso o sourceType não esteja disponível
            
            let alerta = UIAlertController(title: "Alerta", message: "O Photo Library não está disponível, por isso não será possível exibi-lo!", preferredStyle: .alert)
            
            let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(acaoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
        
    }
    @IBAction func abrirCamera(_ sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            
            let alerta = UIAlertController(title: "Alerta", message: "A câmera não está disponível, por isso não será possível acessá-la!", preferredStyle: .alert)
            
            let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(acaoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
        
    }
    @IBAction func salvarAlbum(_ sender: AnyObject) {
        
        if let imagem = self.imageViewAlbum.image {
            
            UIImageWriteToSavedPhotosAlbum(imagem, nil, nil, nil)
            
        }
        
    }
    @IBAction func salvarDocuments(_ sender: AnyObject) {
        
        if let imagem = self.imageViewAlbum.image {
        
            let imagemData = UIImagePNGRepresentation(imagem)
            
            if let dataTemp = imagemData {
                try? dataTemp.write(to: URL(fileURLWithPath: pathArquivo))
            }
            
        }
        
    }
    @IBAction func recuperarImagemSalva(_ sender: AnyObject) {
        
        let imagem = UIImage(contentsOfFile: pathArquivo)
        
        self.imageViewDocuments.image = imagem
        
    }
    
    // MARK: - Métodos de UIImagePickerControllerDelegate
    
    // Método quando o usuário faz uma seleção no picker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // Resgatando a imagem selecionada pelo usuário
        let imagemEscolhida = info[UIImagePickerControllerOriginalImage]
        
        // Atribuição a nossa imageView
        self.imageViewAlbum.image = imagemEscolhida as? UIImage ?? nil
        
        print("Selecionou uma parada!")
        picker.dismiss(animated: true, completion: nil)
        
    }

    // Método que é disparado quando o usuário cancela a seleção
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelou!")
        picker.dismiss(animated: true, completion: nil)
    }
    
    


}

