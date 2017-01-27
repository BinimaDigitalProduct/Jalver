//
//  Inject.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 25/1/17.
//
//

import Foundation

protocol InjectedProperty {
    
    func resolve(_ module: Module)
    
}

final class Inject<T: Configurator> {
    
    var injected: T.Configured {
        return Jalver.resolve(T.self)
    }
    
}
