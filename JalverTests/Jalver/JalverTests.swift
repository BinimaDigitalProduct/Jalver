//
//  JalverTests.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import XCTest

class JalverTest: XCTestCase {
    
    func testJalverResolveStructPersonWithNameJane() {
        let solvedPerson = Jalver.resolve(Person)
        XCTAssertEqual(solvedPerson.name, "Jane", "Person name must be Jane")
    }
    
    func testJalverResolveFinalClassCarWithModelA3() {
        let solvedCar = Jalver.resolve(Car)
        XCTAssertEqual(solvedCar.model, "A3", "Car model must be A3")
    }
    
    func testJalverResolveFinalClassCarWithBrandAudi() {
        let solvedCar = Jalver.resolve(Car)
        XCTAssertEqual(solvedCar.brand, "Audi", "Car brand must be Audi")
    }
}

