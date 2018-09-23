//
//  DocumentViewFactory.swift
//  Patterns
//
//  Created by Syed Saud Arif on 22/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation
import AppKit

protocol DocumentViewFactory {
    func createViewToShowDocument (at path:String, with frame:NSRect) -> DocumentView?
}

extension DocumentViewFactory {
    func getExtensionFromFile (at path:String) -> String {
        if let url = URL.init(string: path) {
            return url.pathExtension
        }
        return ""
    }
}


class MediaViewFactory: DocumentViewFactory {
    func createViewToShowDocument (at path:String, with frame:NSRect) -> DocumentView? {
        
        var view:DocumentView? = nil
        
        switch getExtensionFromFile(at: path){
        case "mpeg", "mp4":
            view = MyAVPlayerView.init(frame: frame)
        case "png", "jpeg":
            view = MyGraphicsView.init(frame: frame)
        default:
            ()
        }
        
        guard let docView = view else {
            return nil
        }
        
        docView.initWithDocumentPath(path)
        return docView
        
    }
}

class TextViewFactory: DocumentViewFactory {
    
    func createViewToShowDocument (at path:String, with frame:NSRect) -> DocumentView? {
        
        var view:DocumentView? = nil
        
        switch getExtensionFromFile(at: path){
        case "txt":
            view = MyPlainTextView.init(frame: frame)
        case "rtf":
            view = MyRichTextView.init(frame: frame)
        default:
            ()
        }
        
        guard let docView = view else {
            return nil
        }
        
        docView.initWithDocumentPath(path)
        return docView
        
    }
}



