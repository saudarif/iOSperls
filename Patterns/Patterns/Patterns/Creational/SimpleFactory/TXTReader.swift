//
//  TXTReader.swift
//  Patterns
//
//  Created by Syed Saud Arif on 13/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation

class TXTReader : TextReader {
    var content: NSAttributedString?
    
    var title: String
    
    var fileURL: URL
    
    func read() {
        do {
            let contentStr = try String.init(contentsOf: fileURL)
            content = NSAttributedString.init(string: contentStr)
            title = fileURL.lastPathComponent
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
