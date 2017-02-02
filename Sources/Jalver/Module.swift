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
        let builder = builder.init(self)
        builder.registerDependencies()
        let definition = BuilderDefinition(builder: builder)
        self.definitions[key] = definition
    }
    
    public func resolve<T>(tag: Tag? = nil, with: @escaping (inout Any) -> Void = {_ in}) -> T {
        let key = Key(type: T.self, tag: tag)
        
        if let definition = self.definitions[key] {
            return definition.build(module: self, with) as! T
        }
        
        if let definition = self.defintion(for: T.self, tag: tag) {
            return definition.build(module: self, with) as! T
        }
        
        fatalError("Not found definition with tag: \(tag) to type: \(T.self)")
    }
    
    public init() {
        self.load()
    }
    
    open func load() {
        fatalError("Calling load on not implemented module: \(self)")
    }
    
    private func defintion<T>(for: T.Type, tag: Tag?) -> Definition? {
        return self.definitions.first { $0.key.tag == tag && $0.value.builds(type: T.self) }?.value
    }
    
}
