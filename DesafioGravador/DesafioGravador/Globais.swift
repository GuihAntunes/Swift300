//
//  Globais.swift
//  DesafioGravador
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

var sandBoxPath = NSHomeDirectory()

var documentsPath = (sandBoxPath as NSString).appendingPathComponent("Documents")

// Refactor this
var filePath = (documentsPath as NSString).appendingPathComponent("gravacao.caf")
