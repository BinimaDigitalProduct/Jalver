//
//  Module.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

open class Module {
    
    typealias Factory = () -> Any
    
    var factories: [Key: Factory] = [:]
    var components: [Key: Any] = [:]
    
    public func register<B: Builder>(tag: Tag? = nil, _ builder: B.Type) {
        let key = Key(type: builder.BuildingType.self, tag: tag)
        self.factories[key] = { Jalver.resolve(builder, with: self) }
    }
    
    public func resolve<T>(tag: Tag? = nil) -> T? {
        let key = Key(type: T.self, tag: tag)
        return self.factories[key]!() as? T
    }
    
    public init() {
        self.load()
    }
    
    open func load() {
        fatalError("Calling load on not implemented module: \(self)")
    }
    
}


