//
//  ViewController.swift
//  Swift300_Day1_4_Lembretes
//
//  Created by Swift on 14/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Attributes
    
    var notes:String = ""
    
    let fileMan = FileManager.default
    
    var pathSandbox:String = ""
    
    var pathDocuments:String = ""
    
    var pathNotes:String = ""
    
    // MARK: - Outlets
    
    @IBOutlet weak var notesList: UITextView!
    
    @IBOutlet weak var myDataEntrance: UITextField!
    
    
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.notesList.isEditable = false
        
        self.pathSandbox = NSHomeDirectory()
        
        self.pathDocuments = (pathSandbox as NSString).appendingPathComponent("Documents")
        
        self.pathNotes = (pathDocuments as NSString).appendingPathComponent("notes.txt")
        
        print("\n\n\n \(pathDocuments)")
        
        if fileMan.fileExists(atPath: pathNotes) {
            
            if let allNotes = try? String(contentsOfFile: pathNotes) {
                self.notes = allNotes
            }
            notesList.text = notes
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: General Functions
    
    func addNote(){
        if let addedNote = myDataEntrance.text {
            notes += "\(addedNote)\n"
        }
        try? notes.write(toFile: pathNotes, atomically: true, encoding: .utf8)
        notesList.text = notes
        myDataEntrance.text = ""
    }
    
    // MARK: Button Fuctions
    
    @IBAction func addNotes(_ sender: AnyObject) {
        
        if fileMan.fileExists(atPath: pathNotes) {
            addNote()
        }else{
            let keepNotes = self.notes
            try? keepNotes.write(toFile: pathNotes, atomically: true, encoding: .utf8)
            addNote()
        }
    }
    
    @IBAction func eraseNotes(_ sender: AnyObject) {
        
        if fileMan.fileExists(atPath: pathNotes) {
            try? fileMan.removeItem(atPath: pathNotes)
            notesList.text = "Seus lembretes aparecerão aqui"
            
        }else{
            notesList.text = "Não há lembretes para serem apagados"
        }
        
    }
    
}
