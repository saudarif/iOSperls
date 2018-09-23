//
//  TextView.swift
//  Patterns
//
//  Created by Syed Saud Arif on 23/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation
import AppKit

class MyPlainTextView : NSTextField, DocumentView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    
    func initWithDocumentPath( _ path: String) {
        if let url = URL.init(string: path) {
            let contentStr = try! String.init(contentsOf: url)
            self.isBezeled = false
            self.drawsBackground = false
            self.isEditable = false
            self.isSelectable = false
            self.stringValue = contentStr
        }
    }
    
}


class MyRichTextView : NSTextField, DocumentView {
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    
    func initWithDocumentPath( _ path: String) {
        if let url = URL.init(string: path) {
            let content = try! NSAttributedString(url: url, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
            self.isBezeled = false
            self.drawsBackground = false
            self.isEditable = false
            self.isSelectable = false
            self.attributedStringValue = content
        }
    }
    
}


