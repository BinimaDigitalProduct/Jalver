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

private final class PersonConfigurator: Configurator {
    
    var name: String!
    
    func configure() -> Person {
        return Person(name: self.name)
    }
    
}