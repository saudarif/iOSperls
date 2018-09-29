//
//  Theam.swift
//  Patterns
//
//  Created by Syed Saud Arif on 25/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation
import AppKit

protocol Theam {
    
    var BackgroundColor  :NSColor {get set}
    var TextColor        :NSColor {get set}
    var TextFont         :NSFont {get set}
    
}

class SinglePageTheam : Theam {

    
    var _backgroundColor  :NSColor
    var _textColor        :NSColor
    var _textFont         :NSFont
    
    var BackgroundColor: NSColor {
        get{
            return _backgroundColor
        }
        set {
            _backgroundColor = newValue
        }
    }
    
    var TextColor: NSColor {
        get{
            return _textColor
        }
        set {
            _textColor = newValue
        }
    }
    
    var TextFont: NSFont {
        get{
            return _textFont
        }
        set {
            _textFont = newValue
        }
    }
    
    init(){
        _backgroundColor = NSColor.white
        _textColor = NSColor.black
        _textFont = NSFont.systemFont(ofSize: 10)
    }
    
}
