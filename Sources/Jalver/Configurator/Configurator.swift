//
//  Configurator.swift
//  Jalver
//
//  Created by Julian Alonso on 25/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

public protocol Configurator: JalverScopeable {
    
    associatedtype Configured
    
    init()
    
    func configure() -> Configured
    
}

open class ParentConfigurator<T>: Configurator {
    public typealias Configured = T
    required public init() {
        
    }
    
    open func configure() -> Configured {
        fatalError("JALVER: Calling not implemented configure() at: \(self)")
    }
}
