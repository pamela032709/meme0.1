//
//  TextDelegate.swift
//  meme0.1
//
//  Created by Pamela Rios on 7/17/16.
//  Copyright © 2016 POCH. All rights reserved.
//

import UIKit

class TextDelegate:NSObject, UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
         textField.resignFirstResponder()
           return true
    
    }
}
