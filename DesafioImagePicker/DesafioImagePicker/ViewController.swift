//
//  ViewController.swift
//  DesafioImagePicker
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITableViewDataSource, UITableViewDelegate{
    
    // MARK: - Outlets
    @IBOutlet weak var myTableView: UITableView!
    
    // MARK: - Properties
    
    var auxImage:UIImage?
    
    var auxRowName:[String] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    @IBAction func saveImage(_ sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)){
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    @IBAction func takeAPicture(_ sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }else{
            
            let alerta = UIAlertController(title: "Atenção", message: "Câmera indisponível!", preferredStyle: .alert)
            
            let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alerta.addAction(acaoOk)
            
            self.present(alerta, animated: true, completion: nil)
            
        }
        
    }
    
    // MARK: - TableView Data Source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        cell.textLabel?.text = auxRowName[indexPath.row]
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return getNumberOfImagesSaved()
        
    }
    
    // MARK: - Methods of TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    // MARK: - Methods of QLPreviewControllerDataSource
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
   /*
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        // TODO
        
    }
    
    */
    
    // MARK: - Methods of UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage]
        
        self.auxImage = chosenImage as? UIImage ?? nil
        
        if let image = auxImage {
            
            if let imageData = UIImagePNGRepresentation(image){
                
                try? imageData.write(to: URL(fileURLWithPath: createPathForImage()))
                
            }
            
            
            
        }
        
        auxRowName.append(getLastFilePath())
        myTableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
        
        
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
        
    }
    
}

