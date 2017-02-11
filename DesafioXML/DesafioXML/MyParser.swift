//
//  MyParser.swift
//  DesafioXML
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class MyParser: NSObject, XMLParserDelegate {
    
    // MARK: - Properties
    
    private var array : [Dictionary<String,String>] = []
    private var studentDictionary = [String : String]()
    private var actualTag = ""
    private var tagContent = ""
    
    // MARK: - Delegate Propertie
    
    var delegate : MyParserDelegate?

    // MARK: - General Methods
    
    func getArray() -> [Dictionary<String,String>] {
        return array
    }
    
    func cleanVariables(){
        
        self.actualTag = ""
        self.tagContent = ""
        
    }
    
    func initiateParse() {
        
        guard let filePath = Bundle.main.url(forResource: "dados", withExtension: "xml") else { return }
            
        let xmlParser = XMLParser(contentsOf: filePath)
            
        xmlParser?.delegate = self
        
        xmlParser?.parse()

    }
    
    // MARK: - XMLParserDelegate Methods
    
    func parserDidStartDocument(_ parser: XMLParser) {
        
        
        
    }
    
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
        
        self.delegate?.myParserAlreadyFinished(self.array)
        
    }


}

protocol MyParserDelegate {
    
    func myParserAlreadyFinished(_ result : [Dictionary<String, String>])
    
}
