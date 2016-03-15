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
        let solvedVehicle = Jalver.resolve(VehicleConfigurator.self) { (inout configurator: VehicleConfigurator) -> Void in
            configurator.model = "A3"
        }
        XCTAssertEqual(solvedVehicle.model, "A3", "Vehicle model must be equal to A3")
    }
    
    func testCreatingCarFinalClassWithConfiguratorModelA3BrandAudi() {
        let solvedCar = Jalver.resolve(CarConfigurator.self) { (inout configurator: CarConfigurator) -> Void in
            configurator.brand = "Audi"
        }
        XCTAssertEqual(solvedCar.model, "A3", "Car model must be equal to A3")
        XCTAssertEqual(solvedCar.brand, "Audi", "Car brand must be equal to Audi")
    }
    
    func testCreatingPersonStructWithConfiguratorAndNamePaco() {
        let person = Jalver.resolve(PersonConfigurator.self) { (inout configurator: PersonConfigurator) -> Void in
            configurator.name = "Paco"
        }
        XCTAssertEqual(person.name, "Paco", "Person name must be equal to Paco")
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