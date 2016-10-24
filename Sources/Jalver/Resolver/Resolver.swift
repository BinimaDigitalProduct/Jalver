//
//  Resolver.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

public protocol Resolver {
    
    static func resolve() -> Self
    
    mutating func postInit()
    
}

public extension Resolver {
    
    func afterInjections(_ injections:(_ solved: Self) -> Self) -> Self {
        return injections(self)
    }
    
    mutating func postInit() { }
    
}
