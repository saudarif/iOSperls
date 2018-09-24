//
//  Prototype.swift
//  Patterns
//
//  Created by Syed Saud Arif on 23/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation

protocol Prototype {
    
    associatedtype this
    
    init(byCopying other:this)
    
    func clone() -> this
    
    
}



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



