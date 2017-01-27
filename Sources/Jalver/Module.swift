//
//  Module.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

public class Module {
    
    typealias Factory = () -> Any
    
    var components: [Key: Factory] = [:]
    
    private func register<T: Configurator>(tag: Tag? = nil, _ configurator: T.Type, _ with: ((inout T, Module) -> Void)? = nil) {
        let key = Key(type: configurator.Configured.self, tag: tag)
        self.components[key] = {
            Jalver.resolve(configurator) { [unowned self] (c: inout T) in
                with?(&c, self)
            }
        }
    }
    
    private func register<B: Builder>(tag: Tag? = nil, _ builder: B.Type) {
        let key = Key(type: builder.BuildingType.self, tag: tag)
        self.components[key] = {
            
        }
    }
    
    func resolve<T>(tag: Tag? = nil) -> T? {
        let key = Key(type: T.self, tag: tag)
        return self.components[key]!() as? T
    }
    
    init() {
        self.load()
    }
    
    func load() {
        fatalError("Calling load on not implemented module: \(self)")
    }
}


