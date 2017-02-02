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

    func build(module: Module, _ with: @escaping (inout Any) -> Void) -> Any
    
}

final class BuilderDefinition<U>: Definition where U: BuilderProtocol {

    var builder: U
    
    init(builder: U) {
        self.builder = builder
    }
    
    func build(module: Module, _ with: @escaping (inout Any) -> Void) -> Any {
        return Jalver.resolve(self.builder, module: module) { (builder: inout U) in
            var abuilder: Any = builder
            with(&abuilder)
        }
    }
    
    func builds(type: Any.Type) -> Bool {
        return self.builder.builds(type: type)
    }
    
}
