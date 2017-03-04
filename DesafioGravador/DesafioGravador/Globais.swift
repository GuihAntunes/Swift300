//
//  Globais.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

private var sandBoxPath = NSHomeDirectory()

var documentsPath = (sandBoxPath as NSString).appendingPathComponent("Documents")

// Refactor this
var filePath = ""

private var allRecords:Dictionary <String, URL> = [:]

func addRecord(nome : String){
    
    filePath = (documentsPath as NSString).appendingPathComponent("\(nome).caf")
    let fileUrl = URL(fileURLWithPath: filePath)
    allRecords[nome] = fileUrl
    
}

func removeRecord(nome: String){
    
    allRecords.removeValue(forKey: nome)
    
}

func removeAllRecords(){
    
    allRecords.removeAll()
    
}

func getAllRecords() -> Dictionary <String, URL> {
    return allRecords
}

func getCountAllRecords() -> Int{
    return allRecords.count
}

func recordsDictionaryIsEmpty() -> Bool {
    return allRecords.isEmpty
}

func getARecord(nome: String) -> URL {
    return allRecords[nome]!
}
