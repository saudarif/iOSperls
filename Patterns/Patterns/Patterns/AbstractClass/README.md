# Abstract Class in swift

This topic will try to introduce a way to create Abstract class in swift language.

## What is an Abstract class ?

Abstract classes are classes that contain one or more abstract methods. 

### Now what is an Abstract method again ?
An abstract method is a method that is declared, but contains no implementation. Abstract classes may not be instantiated, and require subclasses to provide implementations for the abstract methods.

## Getting Started

Ya ya I know that Swift does not have provision for abstract classes. But here we will try to find that how can we atleast achive the same functionality in swift. 
We are going to use Protocols in swift to create the abstract class behaviour. The reason behind choosing protocol is simple : like abstract classes, we cannot create instance of a protocols.

So lets create our protocol (or abstract class).
```
protocol Human {
    func gender() -> String
}
```

And now create classes that confirms the protocol (or create subclasses of abstract class).

```
class Man : Human {
    func gender() -> String {
        return "Male"
    }
}

class Woman : Human {
    func gender() -> String {
        return "Female"
    }
}
```

Lets see how can we use this

```
let geralt = Man()
print(geralt.gender())      //Male

let yennefer = Woman()
print(yennefer.gender())    //Female
```

Thats all is fine, but if we try to create an object of our protocol (our abstract class). We will get an error.

```
let geralt = Human()        //Compile time error - 'Human' cannot be constructed because it has no accessible initializers
```

### But are we not forgetting something ??
Abstract classes can have non-abstract functions too. That means the functions with their implementations. And all the sub-classes will get those functions by default.
Now that is a problem for us.
Protocols provide a blueprint for Methods, properties and other requirements functionality. It is just described as a methods or properties skeleton instead of implementation. We cannot provide an implementation of a function inside a protocol. But abstract classes on the other hand can have functions with their implementations.
To solve this problem we need to take help of protocol extensions.
So lets add some function definitions in our protocol (or abstract class)

```
extension Human {
    func introduce() {
        print("Hello!! I am a Human.")
    }
}

```

Now lets see how can we use this.

```
let geralt = Man()
print(geralt.gender())      //Male

let yennefer = Woman()
print(yennefer.gender())    //Female

geralt.introduce()          //Hello!! I am a Human.
yennefer.introduce()        //Hello!! I am a Human.

```


And that is all to it.

See you in the next post. :]
