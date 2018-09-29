# Singleton Design Pattern

 The Singleton Pattern is a software design pattern that restricts the instantiation of a class to one object. This is useful when exactly one object is needed to coordinate actions across the system.
 
 ### Examples of Singleton Design Pattern.
 
 If you are an iOS or mac OSX developer you might be using this pattern already. You might have seen lines of code like below.

```
// User Default's singleton instance can be accessed like this.
let standardUserDefaults = UserDefaults.standard

// File Manager's singleton instance can be accessed like this.
let defaultFileManager = FileManager.default
```

## How to Create a Singleton Object.

Lets take an example of LogManager. In many applications we need a logging mechanism, usually that contains a singleton interface or a manager to maintain logging queue, etc. So Our Logging Manager will do exactly that.<br\>

```
class LogManager {

    static let shared = LogManager()

    private init() {}


    fileprivate func log(_ message: String) {
        //Logging Code goes here....
    }
}
```

There are somethings in the above code that are importaint. First of all the constaructor is private. This is done so that no other class can aceess the constructor. This is importaint because we want to create instance of LogManager only and only inside the LogManager class.<br\>

The next importaint thing is static 'shared' instance. This property is declared constant because we will never need to change the instance.

Lets see how can we use this shared instance.

```
LogManager.shared.log("first message")

```
That is it. This concludes our Singleton pattern implementation. But can we make it better? Well Yes,<br\>
Lets consider a situation that needs us to perform some configuration after initialization of our shared instance. This is easy thing to do by converting the static property to computed static property.

```
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
```

Thats all. See you guys in next post. :]


