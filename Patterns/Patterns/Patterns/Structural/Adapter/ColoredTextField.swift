//
//  ColoredTextField.swift
//  AdapterDemo
//
//  Created by Syed Saud Arif on 30/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Cocoa

class ColoredTextField: NSTextField {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        //Lets color....
        
        self.backgroundColor = NSColor.brown
        self.textColor = NSColor.white
        self.focusRingType = .none
    }
    
}

extension ColoredTextField :LoginPageTextField {
    func shake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.1, 0.3, 0.5, 0.6]
        animation.duration = 0.6
        animation.isAdditive = true
        
        self.layer?.add(animation, forKey: "move")
    }
    
    func reset() {
        self.stringValue = ""
    }
    
    
}




