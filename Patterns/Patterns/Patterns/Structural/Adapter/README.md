# Adapter Design Pattern

This topic will try to introduce a way to use an adapter design pattern using swift language.

## What is an Adapter? 

Understanding Adapter is easy, as there are lots of adapters in real world. For Example, lets consider a PS/2 to USB adapter, this adapter allows a PS/2 mouse to work with a USB port.<br/>

Functionality of Adapter Design Pattern is not that different from the real world adapters.  In design patterns, adapters are used when we have a class (Client) expecting some type of object and we have an object (Adaptee) offering the same features but exposing a different interface. In such situations we need adapter. Adapter will act as a bridge between Client and Adaptee so that they can work with each other.<br/>

One importaint point : The Adapter will not change Client, it will only affect the Adaptee.

## Lets Understand by example.

### Problem Statement.

To demonstarte Adapter in action we will take a very simple example of a Login Page. <br/> 

In this Example we have a LoginViewController that contains two TextFields -  one for username and another one for password.
It also contains 2 Buttons - one is Login Button and another is Reset Button.
The class looks like this -

```
class LoginViewController: NSViewController {

    @IBOutlet var tfUserName:ColoredTextField!
    @IBOutlet var tfPassword:SecuredColoredTextField!

    @IBAction func resetPressed(sender:NSButton) {
        tfUserName.shake()
        tfUserName.reset()

        tfPassword.shake()
        tfPassword.reset()
    }

    @IBAction func loginPressed(sender:NSButton) {
        if(tfUserName.stringValue != "tom" || tfPassword.stringValue != "jerry"){
            tfPassword.shake()
        }
        else{
            //Login Success.....
        }
    }

}
```

Lets discribe the code for a bit.<br/>

The firrst IBOutlets is a textfield for UserName, and second IBOutlet is a textField for password.<br/> 

The first IBAction is called when ResetButton is pressed. It will shake ( Shaking Animation ) and reset ( set the string value of text field to empty ) both the text fields.<br/>

The Second IBAction will try to login and will  be called when the login Button is pressed. If login is not successfull it will shake the password text field, so that user will know that password is wrong.<br/>


This LoginViewController class will act as a Client in our Adapter Pattern's Example. And the TextFields - UserName and Password will act as Adaptees. Lets see the Text Fields classes  - ColoredTextField and SecuredColoredTextField.


Lets see the code of ColoredTextField.
```
class ColoredTextField: NSTextField {

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        //Lets color....

        self.backgroundColor = NSColor.brown
        self.textColor = NSColor.white
        self.focusRingType = .none
    }
}
```


SecuredColoredTextField - 
```
class SecuredColoredTextField: NSSecureTextField {

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        //Lets color....

        self.backgroundColor = NSColor.brown
        self.textColor = NSColor.white
        self.focusRingType = .none
    }
}
```

Now as we can see that the LoginViewController expects the textFields to expose methods like - shake() and reset(). But the textField classes - ColoredTextField and SecuredColoredTextField do not have these methods. To solve this problem we will use Adapter Design Pattern. Where LoginViewController will act as a Client, and ColoredTextField and SecuredColoredTextField will act as adaptees. And our Adapter will be a protocol - LoginPageTextField.

```
protocol LoginPageTextField {

    func shake()
    func reset()

}
```

The adaptees will confirm to the adapter. So that they can implement the adapter methods. Lets see the implementation of ColoredTextField confirming the LoginPageTextField. In Swift we can do this easily by using an Extension of  ColoredTextField class.
```
extension ColoredTextField :LoginPageTextField {
    
    func shake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.1, 0.3, 0.5, 0.6]
        animation.duration = 0.6
        animation.isAdditive = true

        self.layer?.add(animation, forKey: "move")
    }

    func reset() {
        self.stringValue = ""
    }
}
```

And the SecuredColoredTextField's extension - 
```
extension SecuredColoredTextField :LoginPageTextField {
    func shake() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.1, 0.3, 0.5, 0.6]
        animation.duration = 0.6
        animation.isAdditive = true

        self.layer?.add(animation, forKey: "move")
    }

    func reset() {
        self.stringValue = ""
    }
}
```

Once we have implemented these extensions, our jobe is done. The textFields are adapted as the client requires them.

And thats all to it. That is how you use an Adapter Pattern. :]






