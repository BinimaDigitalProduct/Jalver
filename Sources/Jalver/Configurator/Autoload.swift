//
//  Autoload.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 1/2/17.
//
//

import Foundation

fileprivate class BuilderModule: Module {
    public override func load() {
        
    }
}

public extension Builder {
    
    public static func autoload() -> Module {
        let module = BuilderModule()
        let builder = self.init(module)
        module.register(self.self)
        builder.registerDependencies()
        return module
    }
    
}
