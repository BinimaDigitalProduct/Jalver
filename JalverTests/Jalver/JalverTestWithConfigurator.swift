//
//  JalverTestWithConfigurator.swift
//  Jalver
//
//  Created by Julian Alonso on 15/3/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import XCTest

class JalverTestWithConfigurator: XCTestCase {
    
    func testCreatingVehicleClassWithConfiguratorAndModelAudi() {
        let solvedVehicle = Jalver.resolve(VehicleConfigurator.self) { (configurator: inout VehicleConfigurator) -> Void in
            configurator.model = "A3"
        }
        XCTAssertEqual(solvedVehicle.model, "A3", "Vehicle model must be equal to A3")
    }
    
    func testCreatingCarFinalClassWithConfiguratorModelA3BrandAudi() {
        let solvedCar = Jalver.resolve(CarConfigurator.self) { (configurator: inout CarConfigurator) -> Void in
            configurator.brand = "Audi"
        }
        XCTAssertEqual(solvedCar.model, "A3", "Car model must be equal to A3")
        XCTAssertEqual(solvedCar.brand, "Audi", "Car brand must be equal to Audi")
    }
    
    func testCreatingPersonStructWithConfiguratorAndNamePaco() {
        let person = Jalver.resolve(PersonConfigurator.self) { (configurator: inout PersonConfigurator) -> Void in
            configurator.name = "Paco"
        }
        XCTAssertEqual(person.name, "Paco", "Person name must be equal to Paco")
    }
    
    //MARK: - Singleton
    func testCreatingVehicleSingletonWithConfigurator() {
        let first = Jalver.resolve(SingletonVehicleConfigurator.self)
        let second = Jalver.resolve(SingletonVehicleConfigurator.self)
        
        XCTAssert(first === second, "Second object must be identical to first object")
    }
    
    func testCreatingVehicleSingletonWithConfiguratorAndRuntimeArgs() {
        let first = Jalver.resolve(SingletonCarConfigurator.self) { (configurator: inout SingletonCarConfigurator) in
            configurator.brand = "BMW"
        }
        let second = Jalver.resolve(SingletonCarConfigurator.self)
        
        XCTAssertEqual(first.brand, "BMW", "The car brand must be BMW")
        XCTAssertEqual(second.brand, "BMW", "The car brand must be BMW")
        XCTAssert(first === second, "Second object must be identical to first object")
    }
}

// MARK: - Configurators
private final class VehicleConfigurator: Configurator {
    
    var model: String!
    
    func configure() -> Vehicle {
        return Vehicle(model: self.model)
    }
    
}

//With this also test that configurator can be a struct.
private struct CarConfigurator: Configurator {
    
    var brand: String!
    
    func configure() -> Car {
        return Car(model: "A3", brand: self.brand)
    }
    
}

private final class PersonConfigurator: Configurator {
    
    var name: String!
    
    func configure() -> Person {
        return Person(name: self.name)
    }
    
}

private final class SingletonVehicleConfigurator: Configurator, Singleton {

    func configure() -> Vehicle {
        return Vehicle(model: "X5")
    }
    
}

private final class SingletonCarConfigurator: Configurator, Singleton {
    
    var brand: String!
    
    func configure() -> Car {
        return Car(model: "X3", brand: self.brand)
    }
    
}
