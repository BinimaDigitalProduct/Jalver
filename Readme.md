#JALVER

Swift lightweight factory framework.

---

##Basic usage
The usage is simple, you only need to create a extension of your **final** class or struct with the implementation of `Resolver` protocol. The only thing to do here is create your Object and return it.

```swift
extension Person: Resolver {

    static func resolve() -> Person {
        return Person(name: "Julian")
    }
    
}
```

From now, **Jalver** will call the resolve method and return your object. The way to do it is this:

```swift 
let person = Jalver.resolve(Person)
```

**Jalver** will use the resolve method declared on your object extension to create the instance and will return it.


##After injection.
There is two ways to do this.
You can do a global after injection method with the Resolver extension of your object, let's take a look:

```swift
extension Person: Resolver {

    static func resolve() -> Person {
        return Person(name: "Julian").postInit() { (solved) -> Person in
				solved.secondName = "Alonso"
				return solved
			}
    }
    
}
```
With this, the secondName property of our final class must be declared like `var`.

The second way of do this is writing the `postInit()`method after call **Jalver**.resolve() like there:

```swift 
let person = Jalver.resolve(Person).postInit() { (solved) -> Person in
	solved.secondName = "Alonso"
	return solved
}
```


##Run-time arguments.
Actually there is no way to inject runtime arguments calling the resolve method, but you can do it throught the `postInit` method.

---
Developed by Julián Alonso.
