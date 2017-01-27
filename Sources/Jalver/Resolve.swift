//
//  Resolve.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

public extension Jalver {
    
    class func resolve<B>(_ builder: B.Type, with module: Module) -> B.BuildingType where B: Builder {
        let builder = builder.init()
        //Fill builder Inject dependencies
        module.fillInjectProperties(builder)
        let object = builder.build()
        //Fill object Inject dependencies
        module.fillInjectProperties(object)
        return object
    }
    
}

extension Module {
    
    func fillInjectProperties(_ object: Any) {
        let mirror = Mirror(reflecting: object)
        
        var superClassMirror = mirror.superclassMirror
        while superClassMirror != nil {
            superClassMirror?.children.forEach(self.fill)
        }
        
        mirror.children.forEach(self.fill)
    }
    
    func fill(_ child: Mirror.Child) {
        guard let inject = child.value as? InjectedProperty else { return }
        inject.resolve(self)
    }
    
}
