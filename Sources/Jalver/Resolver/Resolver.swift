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
    
}

extension Resolver {
    
    func afterInjections(afterInjections:((solved: Self) -> Self)) -> Self {
        return afterInjections(solved: self)
    }
    
}