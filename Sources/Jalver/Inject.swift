//
//  Inject.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 25/1/17.
//
//

import Foundation

final class Inject<T: Configurator> {
    
    var injected: T.Configured {
        return Jalver.resolve(T.self)
    }
    
}
