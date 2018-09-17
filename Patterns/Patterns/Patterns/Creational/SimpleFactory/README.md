# A Simple Factory in swift

This topic will try to introduce a way to use a simple factory design pattern in swift language.

## What is a Simple Factory ?

The implementation is really simple
We need to create a new object of a type, but instead of creating it directly, we asks the factory object to create it for us, providing the information about the type of object we need.
The factory instantiates a new concrete object and then returns it to us, the returned object is casted to the base (common) type.
And we uses the objects as abstract objects without being aware about their concrete implementation.


## Problem Statement

To demonstarte Simple factory Design patter in action we have taken a very simple example of a text reader. Our problem statement is that we need to create a class that can read a text from a file. And store the contents of the file in form of attrebuted string. The File can be of any format. 
The types of files that we are implementig for our example is :
HTML : [HTMLFile.html](https://github.com/saudarif/iOSperls/tree/master/Patterns/Patterns/Patterns/Creational/SimpleFactory/Resources/HTMLFile.html).
RTF : [RTFFile.rtf](https://github.com/saudarif/iOSperls/tree/master/Patterns/Patterns/Patterns/Creational/SimpleFactory/Resources/RTFFile.rtf).
and TXT : [TXTFile.txt](https://github.com/saudarif/iOSperls/tree/master/Patterns/Patterns/Patterns/Creational/SimpleFactory/Resources/TXTFile.txt).


## Getting Started

The first thing that we need is a base class, or better an [Abstract Class](https://github.com/saudarif/iOSperls/tree/master/Patterns/Patterns/Patterns/AbstractClass). That we will do using swift protocol. 

So lets create our protocol (or abstract type).
```
protocol TextReader {

    var content : NSAttributedString? { get }
    var title : String { get }
    var fileURL : URL { get }

    func read()

    init(withUrlOfFile url : URL)
}

```
Above protocol defines the abstract interface of our Text Reader.
And now create concrete implementation classes that confirms the protocol (or create subclasses of abstract type) . There will be 3 concrete implementations of TextReader, one for reading each type. 

###TXTReader.swift
```
class TXTReader : TextReader {
    var content: NSAttributedString?

    var title: String

    var fileURL: URL

    func read() {
        do {
            let contentStr = try String.init(contentsOf: fileURL)
            content = NSAttributedString.init(string: contentStr)
            title = fileURL.lastPathComponent
        }
        catch {
            print(error.localizedDescription)
        }
    }

    required init(withUrlOfFile url: URL) {
        self.content = nil
        title = ""
        fileURL = url
    }

}
```

###RTFReader.swift
```
class RTFReader : TextReader {
    var content: NSAttributedString?

    var title: String

    var fileURL: URL

    func read() {
        do {
            content = try NSAttributedString(url: fileURL, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    required init(withUrlOfFile url: URL) {
        self.content = nil
        title = ""
        fileURL = url
    }

}
```

###HTMLReader.swift
```
class HTMLReader : TextReader {
    var content: NSAttributedString?

    var title: String

    var fileURL: URL

    func read() {
        do {
            content = try NSAttributedString(url: fileURL, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
        }
    }

    required init(withUrlOfFile url: URL) {
        self.content = nil
        title = ""
        fileURL = url
    }

}
```

In all of the classes above we have implemented the read() function. That is the only actual difference between these classes as each class will read its own type of file.

So, that was all the work around that we need to demonstrate the use of our simplefactory designe pattern. Now lets implement simpleFactory.
We will start be creating the TextReaderFactory class.

This class contains an enum (ReaderType) to deffirentiate between  the type of reader that needs to be created. And it will contain the factory function -  createTextReader().
The factory function takes the enum (ReaderType) and returns the abstract class type (TextReader).

See the implementation below.
```
class TextReaderFactory {

    enum ReaderType {
        case TXT
        case RTF
        case HTML
    }

    func createTextReader(ofType type:ReaderType, withURL url:URL) -> TextReader {
        switch type {
        case .TXT:
            return TXTReader(withUrlOfFile: url)
        case .RTF:
            return RTFReader(withUrlOfFile: url)
        case .HTML:
            return HTMLReader(withUrlOfFile: url)
        }
    }

}
```

That is all.
We have successfully implemeted our simpleFactory design pattern. Now lets see how to use this.

```
func SimpleFactoryDemo() {

    let factory = TextReaderFactory()

    if let textFileURL = Bundle.main.url(forResource: "TXTFile", withExtension: "txt"){
        let reader = factory.createTextReader(ofType: TextReaderFactory.ReaderType.TXT, withURL: textFileURL)
        reader.read()
        print(reader.content?.string ?? "Sorry")
    }
    
}
```
above code was to read .txt Files. Lets see how can we read rtf files.

```
func SimpleFactoryDemo() {

    let factory = TextReaderFactory()

    if let rtfFileURL = Bundle.main.url(forResource: "RTFFile", withExtension: "rtf"){
        let reader = factory.createTextReader(ofType: TextReaderFactory.ReaderType.RTF, withURL: rtfFileURL)
        reader.read()
        print(reader.content?.string ?? "Sorry")
    }

}
```

So as you can see there is almost no change required in reading a different file type. This is because we are coding on interface, and not on implementation.
Same goes for reading HTML file.

```
func SimpleFactoryDemo() {

    let factory = TextReaderFactory()

    if let htmlFileURL = Bundle.main.url(forResource: "HTMLFile", withExtension: "html"){
        let reader = factory.createTextReader(ofType: TextReaderFactory.ReaderType.HTML, withURL: htmlFileURL)
        reader.read()
        print(reader.content?.string ?? "Sorry")
    }

}
```

And that is all to it.

See you in the next post. :]
