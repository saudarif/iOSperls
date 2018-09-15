//
//  TextReaderFactory.swift
//  Patterns
//
//  Created by Syed Saud Arif on 14/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation


class TextReaderFactory {
    
    enum ReaderType {
        case TXT
        case RTF
        case HTML
    }
    
    func createTextReader(ofType type:ReaderType, withURL url:URL) -> TextReader {
        switch type {
        case .TXT:
            return TXTReader(withUrlOfFile: url)
        case .RTF:
            return RTFReader(withUrlOfFile: url)
        case .HTML:
            return HTMLReader(withUrlOfFile: url)
        }
    }
    
}




func SimpleFactoryDemo() {
    
    let factory = TextReaderFactory()
    var reader:TextReader? = nil
    
    if let textFileURL = Bundle.main.url(forResource: "TXTFile", withExtension: "txt"){
        reader = factory.createTextReader(ofType: TextReaderFactory.ReaderType.TXT, withURL: textFileURL)
    }

//    if let textFileURL = Bundle.main.url(forResource: "HTMLFile", withExtension: "html") {
//        reader = factory.createTextReader(ofType: TextReaderFactory.ReaderType.HTML, withURL: textFileURL)
//    }
//
//    if let textFileURL = Bundle.main.url(forResource: "RTFFile", withExtension: "rtf") {
//        reader = factory.createTextReader(ofType: TextReaderFactory.ReaderType.RTF, withURL: textFileURL)
//    }
    
    if let reader = reader {
        reader.read()
        print(reader.content?.string ?? "Sorry")
    }

    
}

