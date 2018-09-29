//
//  Builder.swift
//  Patterns
//
//  Created by Syed Saud Arif on 26/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import AppKit

protocol TheamBuilder {
    
    init(withTheam:Theam);
    
    func setBackgroundColor();
    func setTextColor();
    func setTextFont();
    func getTheam() -> Theam;
    
}


class DarkTheamBuilder : TheamBuilder {
    
    private var theam:Theam
    
    required init(withTheam t: Theam) {
        theam = t
    }
    
    func setBackgroundColor() {
        theam.BackgroundColor = NSColor.darkGray
    }
    
    func setTextColor() {
        theam.TextColor = NSColor.white
    }
    
    func setTextFont() {
        theam.TextFont = NSFont.systemFont(ofSize: 10.0)
    }
    
    func getTheam() -> Theam {
        return theam
    }
}


class LightTheamBuilder : TheamBuilder {
    
    private var theam:Theam
    
    required init(withTheam t: Theam) {
        theam = t
    }
    
    func setBackgroundColor() {
        theam.BackgroundColor = NSColor.white
    }
    
    func setTextColor() {
        theam.TextColor = NSColor.black
    }
    
    func setTextFont() {
        theam.TextFont = NSFont.systemFont(ofSize: 10.0)
    }
    
    func getTheam() -> Theam {
        return theam
    }
}

