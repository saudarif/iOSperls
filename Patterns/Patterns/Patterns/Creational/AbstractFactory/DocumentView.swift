//
//  DocumentView.swift
//  Patterns
//
//  Created by Syed Saud Arif on 23/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation
import AppKit

protocol DocumentView where Self : NSView {
    
    func initWithDocumentPath( _ path: String)
    
}
