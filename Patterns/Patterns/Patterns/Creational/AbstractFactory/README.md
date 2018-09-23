# Abstract Factory in swift

This topic will try to introduce a way to use an abstract factory design pattern in swift language.

## Prerequisite 

Before starting this topic, please go ahead and read [Simple Factory](https://github.com/saudarif/iOSperls/tree/master/Patterns/Patterns/Patterns/Creational/SimpleFactory/README.md) Design Pattern. 

## What is an Absract Factory? 

In a one liner explaination : An abstract factory is a factory of factories.<br/>
Now lets check out a more detailed explaination.<br/>
Abstract Factory pattern is almost similar to Factory Pattern and is considered as another layer of abstraction over factory pattern. Abstract Factory patterns work around a super-factory which creates other factories. It provides interfaces for creating families of related or dependent objects without specifying their concrete classes.


## Lets Understand by example.

### Problem Statement.

To demonstarte Abstract factory in action we will take a very simple example of a document Viewer. Here we will try to create a class that can read contents of a document file.  And Return a NSView that can display the content. And the type of documents that we are going to support are :<br/>
Media Documents : video  and images<br/>
Text Documents : Rich Text Files and Plain Text Files<br/>


to be continued...
