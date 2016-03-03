//
//  Resolver.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

protocol Resolver {
    
    static func resolve() -> Self
    
}

extension Resolver {
    
    func postInit(afterInit:((solved: Self) -> Self)) -> Self {
        return afterInit(solved: self)
    }
    
}