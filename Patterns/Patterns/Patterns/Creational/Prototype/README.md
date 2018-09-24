# Prototype Design Pattern

During application development process, we uswally come across situations in which we need to create copy of an existing object. And in Swift we do that using assignment operator for most of the time. But assignmen operator uswally ends up incrementing the retain count of the object and does not creates a seperate "Duplicate" object. But what if we need to create a duplicate object ? That is if i change the duplicate object, that will not affect the original instance.<br\>
That is where the Prototype Design Pattern helps us.

## Why do we need Prototype Design Pattern ?

Prototype pattern helps in creating copies of an existing object. Now the question is, Why do you want to create a copy ?<br\>
There can be several answers to this, depending on the situation.
* Sometimes Object creation is a costly affair and requires a lot of time and resources. For example calling a DB Querry, or executing an API on server.
* Object is created after following a complex process, repeating that will not be possible.
* Object creation is dependent on machine state, which is now changed.

## Working of Prototype Design Pattern

Working on Prototype design pattern is simple. We tell a prototype to clone itself and it will make its copy.<br\>

But first we need to add clone() function in the class. For that we will need a protocol. Lets call it Prototype.

```
protocol Prototype {

    associatedtype this

    func clone() -> this
}
```
Let us suppose that the Transaction class is the class which we need to add cloning functionality.

```
class Transaction: Prototype {

    var sender:User
    var reciever:User
    var amount:Int

    init(with senderID:Int, recieverID:Int, _amount:Int) {
        sender = User.init(with: senderID)
        reciever = User.init(with: recieverID)
        amount = _amount
    }

    init() {
        sender = User.init(with: -1)
        reciever = User.init(with: -1)
        amount = 0
    }


    func clone() -> Transaction {
        let copiedTransaction = Transaction.init()
        copiedTransaction.sender = self.sender.clone()
        copiedTransaction.reciever = self.reciever.clone()
        copiedTransaction.amount = self.amount
        return copiedTransaction
    }
}
```

Also lets define User class. 

```
class User {

    var id = 0

    init(with _id:Int) {
        id = _id
    }
}
```

And as you can see in the clone function of Transaction class that the User also supports cloning. We can achieve that by adding Prototype functionality in User class.

```
extension User : Prototype {

    func clone() -> User {
        return User.init(with: id)
    }
}
```

As you can see that the clone function of Transaction class creates copies of all the properties of the class. It seems ok for this class, but as this will require a lot of boilerplate code if the number of properties increases.

Lets try to make a better clone() function:
```
class Transaction: Prototype {

    func clone() -> Transaction {
        return Transaction.init(with: self.sender.id, recieverID: self.reciever.id, _amount: self.amount)
    }
}
```

This seems alright. But are we not forgetting copy constructor ? Copy constructor were specifically designed for creating copy. So why cant we use them here. Well the answer is Yes we can. Lets add the copy constructor in Transaction class. Or better lets add it in Prototype.

Here is a new Prototype interface.
```
protocol Prototype {

    associatedtype this

    init(byCopying other:this) //added copy constructor.

    func clone() -> this

}
```

Lets change Transaction class accordingly. 
```
class Transaction: Prototype {

    var sender:User
    var reciever:User
    var amount:Int

    init(with senderID:Int, recieverID:Int, _amount:Int) {
        sender = User.init(with: senderID)
        reciever = User.init(with: recieverID)
        amount = _amount
    }

    required init(byCopying other: Transaction) {
        sender = User.init(with: other.sender.id)
        reciever = User.init(with: other.reciever.id)
        amount = other.amount
    }


    func clone() -> Transaction {
        return Transaction.init(byCopying: self)
    }
}
```

And the modified version of User class will look like this :

```
class User {

    var id = 0

    init(with _id:Int) {
        id = _id
    }

    required init(byCopying other:User) {
        id = other.id
    }
}

extension User:Prototype{

    func clone() -> User {
        return User.init(byCopying: self)
    }
}

```

And That is our implementation of Prototype Design Pattern.
