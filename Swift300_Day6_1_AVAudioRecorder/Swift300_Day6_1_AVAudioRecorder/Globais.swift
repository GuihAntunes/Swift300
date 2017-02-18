//
//  Globais.swift
//  Swift300_Day6_1_AVAudioRecorder
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

// Criando o caminho até o documento salvo

var sandBoxPath = NSHomeDirectory()

var documentsPath = sandBoxPath.appendingPathComponent("Documents")

var filePath = documentsPath.appendingPathComponent("gravacao.caf")
