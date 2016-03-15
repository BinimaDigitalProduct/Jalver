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
        return Person(name: "Julian").afterInjections() { (solved) -> Person in
				solved.secondName = "Alonso"
				return solved
			}
    }
    
}
```
With this, the secondName property of our final class must be declared like `var`.

The second way of do this is writing the `afterInjections()`method after call **Jalver**.resolve() like there:

```swift 
let person = Jalver.resolve(Person).afterInjections() { (solved) -> Person in
	solved.secondName = "Alonso"
	return solved
}
```

##Non final classes
The way to resolve classes that aren't final is with **Configurator**.
Configurator is a protocol designed to create any type of object. Let's take a look a one configurator:

```swift
final class VehicleConfigurator: Configurator {
    
    func configure() -> Vehicle {
        return Vehicle(model: "A3")
    }
    
} 
```

By this way, you create an object that is not a final Class.

##Run-time arguments.
Actually, there is two ways to inject run-time arguments, we can use the `.afterInjection()`method to provide to our object the vars it needs.
This have some **limitations**, we can't inject things throught our `init`method, and the vars that we are assigning cant be `let`.

The second way: Using configurators.
With configuratos we can provide run-time argumets using custom vars in configuratos and providing to the `init`method for instance.

```swift
final class VehicleConfigurator: Configurator {
    
    var model: String!
    
    func configure() -> Vehicle {
        return Vehicle(model: self.model)
    }
    
}

//The way to call this on our code is the next: 
let model = "A3"
let solvedVehicle = Jalver.resolve(VehicleConfigurator.self) { (inout configurator: VehicleConfigurator) -> Void in
            configurator.model = model
        }
```

---
Developed by Julián Alonso.
