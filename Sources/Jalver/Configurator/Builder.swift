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
    
    func registerDependencies()
    
    func build() -> BuildingType
    
    func builds(type: Any.Type) -> Bool
}

open class Builder<T>: BuilderProtocol {
    
    public weak var module: Module!
    
    required public init(_ module: Module) {
        self.module = module
    }
 
    open func registerDependencies() {  }
    
    open func build() -> T {
        fatalError("Calling build on not implemented builder: \(self)")
    }
    
    public func builds(type: Any.Type) -> Bool {
        let otherBuildingTypes: [Any.Type] = [(T?).self, (T!).self]
        return otherBuildingTypes.contains { type == $0 }
    }
    
    
    
}
