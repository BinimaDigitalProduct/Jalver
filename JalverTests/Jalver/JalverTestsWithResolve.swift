//
//  JalverTests.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import XCTest

class JalverTestWithResolve: XCTestCase {
    
    func testJalverResolveStructPersonWithNameJane() {
        let solvedPerson = Jalver.resolve(Person.self)
        XCTAssertEqual(solvedPerson.name, "Jane", "Person name must be Jane")
    }
    
    func testJalverResolveFinalClassCarWithModelA3() {
        let solvedCar = Jalver.resolve(Car.self)
        XCTAssertEqual(solvedCar.model, "A3", "Car model must be A3")
    }
    
    func testJalverResolveFinalClassCarWithBrandAudi() {
        let solvedCar = Jalver.resolve(Car.self)
        XCTAssertEqual(solvedCar.brand, "Audi", "Car brand must be Audi")
    }
    
    func testJalverResolveFinalClassCarWithDefaultPassengersSettedOnPostInitAtCarResolverExtension() {
        let solvedCar = Jalver.resolve(Car.self)
        XCTAssertEqual(solvedCar.passengers, 6, "Car passengers must be equal to 6")
    }
    
    func testJalverResolveFinalClassCarWithPassengersSettedOnPostInit() {
        let solvedCar = Jalver.resolve(Car.self).afterInjections { (solved) -> (Car) in
            solved.passengers = 3
            return solved
        }
        XCTAssertEqual(solvedCar.passengers, 3, "Car passengers must be equal to 3")
    }
    
    func testJalverResolveStructWithPostInitMutatingMethod() {
        let solvedTest = Jalver.resolve(Test.self)
        XCTAssertEqual(solvedTest.text, "Tested", "Test text must be equal to Tested")
    }
}

struct Test {
    
    var text: String?
    
    mutating func postInit() {
        self.text = "Tested"
    }
    
}

extension Test: Resolver {
    
    static func resolve() -> Test {
        return Test()
    }
    
}
