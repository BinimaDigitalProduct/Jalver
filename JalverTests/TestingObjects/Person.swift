//
//  Person.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

struct Person {
    
    let name: String
    var secondName: String?
    
    init(name: String) {
        self.name = name
    }
    
}

extension Person: Resolver {

    static func resolve() -> Person {
        return Person(name: "Jane")
    }
    
}
