# Builder Design Pattern

Builder design patter comes under Creational design patterns, It helps in creating objects which depends on lots of variables and states.

### What is the Need of Builder Design Pattern ?

In software development environment we face situations in which we need to create an object that can store lots of different but related data. An Example of this can be a Theme Object. A Theam class usually contains :
* Navigation Bar Color
* Background Color
* Navigation Item Color
* Text Color 1
* Text Color 2
* Text Color 3
* Hyperlink Color
* Highlighted Background Color
* Highlighted Text Color
* Selected Background Color
* Selected Text Color
* Heading Font
* Text Font
.... and so on.

So to create a theme class interface.

```
protocol Theam {

    var NavigationBarColor     :NSColor {get}
    var BackgroundColor        :NSColor {get}
    var NavigationItemColor    :NSColor {get}
    var TextColor1             :NSColor {get}
    var TextColor2             :NSColor {get}
    var TextColor3             :NSColor {get}
    var HyperlinkColor         :NSColor {get}
    var HighlightedBackgroundColor  :NSColor {get}
    var HighlightedTextColor        :NSColor {get}
    var SelectedBackgroundColor     :NSColor {get}
    var SelectedTextColor           :NSColor {get}
    var HeadingFont             :NSFont {get}
    var TextFont                :NSFont {get}

    init(NavBarCol:NSColor, BGCol:NSColor, NavItemCol:NSColor,
        TxtCol1:NSColor, TxtCol2:NSColor, TxtCol3:NSColor,
        HyperlinkCol:NSColor, HighlgtBGCol:NSColor,
        HighlgtTxtCol:NSColor, SelBGCol:NSColor,
        SelTxtCol:NSColor, HeadingFont:NSFont, TxtFont:NSFont);

}
```

Look at the init function with 13 parameters, that is the problem right there. That is messy? Want a clean solution? Well, Builder pattern is at your service.

## What is Builder Pattern

The Builder pattern separates the construction of a complex object from its representation so that the same construction process can create different representations.<br\>
This definition will become more clear when we see an example on Builder Pattern.<br\>

But Before all that lets discuss the components of Builder Pattern :
* Product – Product class is the complex class that we will end up creating. In Our example the Product class will be a Concrete Theam.

* Builder – Builder is a protocol in Swift. It will define set of methods that will be used to create/configure Product instance. Each method will be implemented by concrete Builder that will provide the actual functionality. That functionality can be mofifed by the concrete builder so that it can create unique product. The GetProduct method is used to return the final product. 

* Concrete Builder – Concrete Builder is the concrete implementation of builder class. See Builder's description for more info.

* Director – The Director class is the one that controlls the algorithm to create the final product. The Constructor of director will take an instance of Builder class to capture the specific concrete Builder. The Director will then call the methods of builder instance in correct order to create Product.

Ok, now lets see our example.

## Lets build some theams.

First of all we will take a Theam interface. But with less number of variables so that we dont have to write lots of code.

```
protocol Theam {
    var BackgroundColor  :NSColor {get}
    var TextColor        :NSColor {get}
    var TextFont         :NSFont {get}

    init(BGCol:NSColor, TxtCol:NSColor, TxtFont:NSFont);
}
```
Lets create a Concrete Theam.

```
class SinglePageTheam : Theam {

    var _backgroundColor  :NSColor
    var _textColor        :NSColor
    var _textFont         :NSFont

    var BackgroundColor: NSColor {
        get{
            return _backgroundColor
        }
        set {
            _backgroundColor = newValue
        }
    }

    var TextColor: NSColor {
        get{
            return _textColor
        }
        set {
            _textColor = newValue
        }
    }

    var TextFont: NSFont {
        get{
            return _textFont
        }
        set {
            _textFont = newValue
        }
    }

    init(){
        _backgroundColor = NSColor.white
        _textColor = NSColor.black
        _textFont = NSFont.systemFont(ofSize: 10)
    }

}
```

Now We need to create our builder interface. We call it TheamBuilder.

```
protocol TheamBuilder {

    init(withTheam:Theam);

    func setBackgroundColor();
    func setTextColor();
    func setTextFont();
    func getTheam() -> Theam;

}
```
As you can see that the TheamBuilder has set of methods that will be used to create/configure Product instance. Each method will be implemented by concrete Builder that will provide the actual functionality. We will create two concrete Theam Builders one for light Theam and One for building DarkTheam.

```
class DarkTheamBuilder : TheamBuilder {

    private var theam:Theam

    required init(withTheam t: Theam) {
        theam = t
    }

    func setBackgroundColor() {
        theam.BackgroundColor = NSColor.darkGray
    }

    func setTextColor() {
        theam.TextColor = NSColor.white
    }

    func setTextFont() {
        theam.TextFont = NSFont.systemFont(ofSize: 10.0)
    }

    func getTheam() -> Theam {
        return theam
    }
}


class LightTheamBuilder : TheamBuilder {

    private var theam:Theam

    required init(withTheam t: Theam) {
        theam = t
    }

    func setBackgroundColor() {
        theam.BackgroundColor = NSColor.white
    }

    func setTextColor() {
        theam.TextColor = NSColor.black
    }

    func setTextFont() {
        theam.TextFont = NSFont.systemFont(ofSize: 10.0)
    }

    func getTheam() -> Theam {
        return theam
    }
}
```
Now Everything is in place, the only thing that is missing is a Director. Lets call our Director the "TheamPainter".

```
class TheamPainter {

    private var builder:TheamBuilder

    init(withBuilder b:TheamBuilder) {
        builder = b
    }

    public func getTheam() -> Theam {
        return builder.getTheam()
    }

    public func paintTheam() {
        self.builder.setBackgroundColor()
        self.builder.setTextColor()
        self.builder.setTextFont()
    }

}
```

Lets see how we can create a Theam using our Builder Pattern.

```
let theam:Theam = SinglePageTheam()
let builder:TheamBuilder = DarkTheamBuilder(withTheam: theam)
let painter = TheamPainter(withBuilder: builder);

painter.paintTheam()

//To get theam, call - painter.getTheam()
```

Well thats all there is... :]










