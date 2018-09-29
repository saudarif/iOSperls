//
//  TheamDirector.swift
//  Patterns
//
//  Created by Syed Saud Arif on 29/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation

class TheamPainter {
    
    private var builder:TheamBuilder
    
    init(withBuilder b:TheamBuilder) {
        builder = b
    }
    
    public func getTheam() -> Theam {
        return builder.getTheam()
    }
    
    public func paintTheam() {
        self.builder.setBackgroundColor()
        self.builder.setTextColor()
        self.builder.setTextFont()
    }
    
}


func BuilderDemo() {
    
    let theam:Theam = SinglePageTheam()
    let builder:TheamBuilder = DarkTheamBuilder(withTheam: theam)
    let painter = TheamPainter(withBuilder: builder);
    
    painter.paintTheam()
    
    //To get painter.getTheam().BackgroundColor
    
    
}

