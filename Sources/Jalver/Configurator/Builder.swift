//
//  Builder.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

public protocol BuilderProtocol {
    
    associatedtype BuildingType
    
    init(_ module: Module)
    
    func build() -> BuildingType
    
}

open class Builder<T>: BuilderProtocol {
    
    public weak var module: Module!
    
    required public init(_ module: Module) {
        self.module = module
    }
    
    open func build() -> T {
        fatalError("Calling build on not implemented builder: \(self)")
    }
    
}
