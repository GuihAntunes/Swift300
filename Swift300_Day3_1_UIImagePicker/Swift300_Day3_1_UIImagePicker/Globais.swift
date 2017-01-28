//
//  Globais.swift
//  Swift300_Day3_1_UIImagePicker
//
//  Created by Swift on 28/01/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

var caminhoParaSandBox = NSHomeDirectory()

var pathDocuments = (caminhoParaSandBox as NSString).appendingPathComponent("Documents")

var pathArquivo = (pathDocuments as NSString).appendingPathComponent("imagem.png")
