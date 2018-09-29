//
//  LogManager.swift
//  Patterns
//
//  Created by Syed Saud Arif on 29/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation

class LogManager {

    static let shared : LogManager = {
       
        let logManagerObj = LogManager.init()
        
        //perform configuration here....
        
        return logManagerObj
        
    }()
    
    private init() {}
    
    
    fileprivate func log(_ message: String) {
        //Logging Code goes here....
    }
    
}
