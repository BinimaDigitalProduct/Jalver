//
//  Module.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

open class Module {
    
    var definitions: [Key: Definition] = [:]
    
    public func register<B: BuilderProtocol>(tag: Tag? = nil, _ builder: B.Type) {
        let key = Key(type: builder.BuildingType.self, tag: tag)
        let definition = BuilderDefinition(factory: { Jalver.resolve(builder, with: self) })
        self.definitions[key] = definition
    }
    
    public func resolve<T>(tag: Tag? = nil) -> T {
        let key = Key(type: T.self, tag: tag)
        
        if let definition = self.definitions[key] {
            return definition.factory() as! T
        }
        
        if let definition = self.defintion(for: T.self) {
            return definition.factory() as! T
        }
        
        fatalError("Not found definition with tag: \(tag) to type: \(T.self)")
    }
    
    public init() {
        self.load()
    }
    
    open func load() {
        fatalError("Calling load on not implemented module: \(self)")
    }
    
    private func defintion<T>(for: T.Type) -> Definition? {
        //Definition must also have tag to the type?? 
        return self.definitions.values.first { $0.builds(type: T.self) }
    }
    
}
