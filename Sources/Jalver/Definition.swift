//
//  Definition.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 31/1/17.
//
//

import Foundation

typealias Factory = () -> Any

protocol TypeBuilder {
    
    /// With this, if the instance is Optional or ImplicitlyUnwrappedOptional, 
    /// check if the definition builds that type
    func builds(type: Any.Type) -> Bool
    
}

protocol Definition: TypeBuilder {

    var type: Any.Type { get }
    var factory: Factory { get }
    var module: Module? { get }
    
}

final class BuilderDefinition<T>: Definition {
    
    var type: Any.Type { return T.self }
    let factory: Factory
    weak var module: Module?
    
    init(factory: @escaping () -> T) {
        self.factory = factory
        self.module = nil
    }
    
    
    func builds(type: Any.Type) -> Bool {
        let otherBuildingTypes: [Any.Type] = [(T?).self, (T!).self]
        return otherBuildingTypes.contains { type == $0 }
    }
    
}
