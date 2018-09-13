//
//  AbstractClass.swift
//  Patterns
//
//  Created by Syed Saud Arif on 13/09/18.
//  Copyright © 2018 Syed Saud Arif. All rights reserved.
//

import Foundation

/*
 * Abstract class.
 * Ya ya I know that Swift does not have provision for abstract classes.
 * But here we will try to find that how can we atleast achive the same functionality in swift.
 *
 *
 * We will use Protocol in swift to create the abstract class behaviour.
 * The reason behind choosing protocol is simple.
 * Like abstract classes we cannot create instance of a protocols.
 *
 */

/*
 * So lets create our protocol (or abstract class).
 */

protocol Human {
    func gender() -> String
}


/*
 * And now create classes (or subclasses of or abstract class).
 */
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


/*
 * Demo func.
 */
func AbstractClass_Demo() {

    let geralt = Man()
    print(geralt.gender())

    let yennefer = Woman()
    print(yennefer.gender())

}

/*
 * But are we not forgetting something ??
 * The protocol cannot have a implementation of any function. But abstract classes can have functions with their implementations.
 * To solve this problem we need to take help of protocol extensions.
 * So lets add some function definitions in our protocol (or abstract class)
 */

extension Human {
    func introduce() {
        print("Hello!! I am a Human.")
    }
}

/*
 * Demo func - 2.
 */
func AbstractClass_Demo2() {
    
    let geralt = Man()
    print(geralt.gender())
    
    let yennefer = Woman()
    print(yennefer.gender())
    
    geralt.introduce()
    yennefer.introduce()
    
}

