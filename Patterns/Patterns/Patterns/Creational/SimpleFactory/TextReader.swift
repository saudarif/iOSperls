//
//  ImageReader.swift
//  Patterns
//
//  Created by Syed Saud Arif on 13/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation

protocol TextReader {
    
    var content : NSAttributedString? { get }
    var title : String { get }
    var fileURL : URL { get }
    
    func read()
    
    init(withUrlOfFile url : URL)
}


