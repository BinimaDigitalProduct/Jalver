//
//  Singleton.swift
//  Jalver
//
//  Created by Julian Alonso on 16/3/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

public protocol Singleton: JalverScopeable {
    
}

public extension Singleton {
    
    func getScope() -> JalverScope {
        return .Singleton
    }
    
}