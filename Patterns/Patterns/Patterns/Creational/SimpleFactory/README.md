# A Simple Factory in swift

This topic will try to introduce a way to use a simple factory design pattern in swift language.

## What is a Simple Factory ?

The implementation is really simple
We need to create a new object of a type, but instead of creating it directly, we asks the factory object to create it for us, providing the information about the type of object we need.
The factory instantiates a new concrete object and then returns it to us, the returned object is casted to the base (common) type.
And we uses the objects as abstract objects without being aware about their concrete implementation.

## Getting Started

The first thing that we need is a base class, or better an [Abstract Class](https://github.com/saudarif/iOSperls/tree/master/Patterns/Patterns/Patterns/AbstractClass). That we will do using swift protocol. 

So lets create our protocol (or abstract type).
```
protocol TextReader {
    func read() -> String
}
```

And now create concrete implementation classes that confirms the protocol (or create subclasses of abstract type) .

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
