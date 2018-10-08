//
//  ViewController.swift
//  AdapterDemo
//
//  Created by Syed Saud Arif on 30/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {

    @IBOutlet var tfUserName:ColoredTextField!
    @IBOutlet var tfPassword:SecuredColoredTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func resetPressed(sender:NSButton) {
        tfUserName.shake()
        tfUserName.reset()
        
        tfPassword.shake()
        tfPassword.reset()
    }
    
    @IBAction func loginPressed(sender:NSButton) {
        if(tfUserName.stringValue != "tom" || tfPassword.stringValue != "jerry"){
            tfPassword.resignFirstResponder()
            tfPassword.shake()
        }
        else{
            let alert = NSAlert()
            alert.messageText = "You are Logged In."
            alert.informativeText = "Success"
            alert.alertStyle = NSAlert.Style.informational
            alert.addButton(withTitle: "OK")
            let res = alert.runModal()
            if res == NSApplication.ModalResponse.alertFirstButtonReturn {
                tfUserName.reset()
                tfPassword.reset()
            }
        }
    }

}

