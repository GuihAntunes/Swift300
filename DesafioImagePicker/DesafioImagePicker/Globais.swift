//
//  Globais.swift
//  DesafioImagePicker
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

private var numImagem:Int = 0

private var savedImages:Int = 0

private var lastFilePath:String = ""

let home = NSHomeDirectory()

let pathDocuments = (home as NSString).appendingPathComponent("Documents")

func createPathForImage() -> String{
    
    let filePath = (pathDocuments as NSString).appendingPathComponent("image_\(numImagem).png")
    
    numImagem += 1
    
    savedImages += 1
    
    lastFilePath = filePath
    
    return filePath
}

func getNumberOfImagesSaved() ->  Int{
    
    return savedImages
    
}

func getLastFilePath() -> String {
    
    return lastFilePath
    
}

