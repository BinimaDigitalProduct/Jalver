//
//  JalverScopeable.swift
//  Jalver
//
//  Created by Julian Alonso on 16/3/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

public enum JalverScope {
    case singleton
    case `default`
}

public protocol JalverScopeable {
    
    func getScope() -> JalverScope
    
}
public extension JalverScopeable {
    
    var scope: JalverScope {
        get {
            return self.getScope()
        }
    }
    
    func getScope() -> JalverScope {
        return .default
    }
    
}
