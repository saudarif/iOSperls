//
//  RTFReader.swift
//  Patterns
//
//  Created by Syed Saud Arif on 13/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation

class RTFReader : TextReader {
    var content: NSAttributedString?
    
    var title: String
    
    var fileURL: URL
    
    func read() {
        do {
            content = try NSAttributedString(url: fileURL, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    required init(withUrlOfFile url: URL) {
        self.content = nil
        title = ""
        fileURL = url
    }
    
}
