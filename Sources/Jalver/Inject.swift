//
//  Inject.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 25/1/17.
//
//

import Foundation

protocol InjectedProperty {

    static var injectType: Any.Type { get }
    
    func resolve(_ module: Module)
    
}

public final class Inject<T>: InjectedProperty {
    
    static var injectType: Any.Type {
        return T.self
    }
    
    var _value: T?
    
    public var value: T {
        return self._value!
    }
    
    public init() { }
    
    func resolve(_ module: Module) {
        print("resolve value of type: \(T.self) at Module: \(module)")
        let solved: T = module.resolve()!
        self._value = solved
    }
    
}
