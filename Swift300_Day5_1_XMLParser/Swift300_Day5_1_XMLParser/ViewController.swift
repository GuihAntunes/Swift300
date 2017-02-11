//
//  ViewController.swift
//  Swift300_Day5_1_XMLParser
//
//  Created by Swift on 11/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    var arrayPessoas : [Dictionary<String, String>] = []
    var dicionarioAluno = [String : String]()
    var tagAtual = ""
    var conteudoTag = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Criando o caminho até o documento de XML
        let pathArquivo = Bundle.main.path(forResource: "dados", ofType: "xml")
        
        // Criando uma URL a partir da string que contém o path do nosso arquivo
        let urlArquivo = URL(fileURLWithPath: pathArquivo!) // refactor this
        
        // Criando um objeto que fará o parse (interpretação) do nosso XML. A classe responsável por este trabalho é o XMLParser (NSXMLParser)
        let xmlParser = XMLParser(contentsOf: urlArquivo)
        
        // Atribuindo o delegate
        xmlParser?.delegate = self
        
        // Acionando o método que faz toda a interpretação do XML
        xmlParser?.parse()
        
    }
    
    // MARK: - XMLParserDelegate Methods
    
    // Este método é disparado quando a interpretação do documento é iniciada
    func parserDidStartDocument(_ parser: XMLParser) {
        
        print("parserDidStartDocument - Iniciou a interpretação do Documento")
        
    }
    
    // Este método é disparado sempre que uma abertura de tag é encontrada
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        print("didStartElement - Abriu uma tag")
        
    }
    
    // Este método é disparado sempre que um fechamento de tag é encontrado
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        print("didEndElement - Fechou uma tag")
        
    }
    
    // Este método é disparado sempre que um conteúdo é encontrado
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        print("foundCharacters - Encontrou conteúdo")
        
    }
    
    // Este método é disparado quando a interpretação do documento é finalizada
    func parserDidEndDocument(_ parser: XMLParser) {
        
        print("parserDidEndDocument - Documento finalizado")
        
    }
    
    // MARK: - Methods
    
    // MARK: - Actions
    
}
