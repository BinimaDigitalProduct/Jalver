//
//  Car.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

final class Car: Vehicle {

    let brand: String
    
    init(model: String, brand: String) {
        self.brand = brand
        super.init(model: model)
    }
    
}

extension Car: Resolver {
    
    static func resolve() -> Car {
        return Car(model: "A3", brand: "Audi")
    }
    
}