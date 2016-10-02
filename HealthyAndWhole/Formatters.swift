//
//  Formatters.swift
//  HealthyAndWhole
//
//  Created by Kyle Brooks Robinson on 9/26/16.
//  Copyright © 2016 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

func numberFormatter(textField: UITextField, inout mainString: String, replacementString: String) -> Bool {
    
    for item in numberEntrySet {
        
        if replacementString == item {
            
            mainString += replacementString
            textField.text = mainString
            return false
            
        }
        
    }
    
    let array = Array(replacementString.characters)
    var currentStringArray = Array(mainString.characters)
    
    if array.count == 0 && currentStringArray.count != 0 {
        
        currentStringArray.removeLast()
        
        mainString = ""
        
        for character in currentStringArray {
            mainString += String(character)
        }
        
        textField.text = mainString
        
    }
    
    return false
    
}