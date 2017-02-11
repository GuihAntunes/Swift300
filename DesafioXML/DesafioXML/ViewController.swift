//
//  ViewController.swift
//  DesafioXML
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    
    var array : [Dictionary<String,String>] = []
    var studentDictionary = [String : String]()
    var actualTag = ""
    var tagContent = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let filePath = Bundle.main.url(forResource: "dados", withExtension: "xml") {
        
            let xmlParser = XMLParser(contentsOf: filePath)
            
            xmlParser?.delegate = self
            xmlParser?.parse()
            
        }
        
    }
    
    // MARK: - XMLParserDelegate Methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.actualTag = elementName
        
        if elementName == "idade" || elementName == "nome" {
            
            self.tagContent = ""
            
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        case "nome":
            
            self.studentDictionary ["nome"] = self.tagContent
            cleanVariables()
            
        case "idade":
            
            self.studentDictionary ["idade"] = self.tagContent
            cleanVariables()
           
        case "aluno":
            
            self.array += [self.studentDictionary]
        
        default:
            break
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.actualTag == "nome" || self.actualTag == "idade" {
            
            self.tagContent += string
            
        }
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        print(array)
        
    }
    
    // MARK: - Methods
    
    func cleanVariables(){
        
        self.actualTag = ""
        self.tagContent = ""
        
    }
    
    // MARK: - Actions
    
}

