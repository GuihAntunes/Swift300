//
//  Extensions.swift
//  Swift300_Day6_1_AVAudioRecorder
//
//  Created by Swift on 18/02/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

extension String {
    
    func appendingPathComponent(_ string : String) -> String {
        return (self as NSString).appendingPathComponent(string)
    }
    
}
