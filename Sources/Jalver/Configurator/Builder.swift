//
//  Builder.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

public protocol Builder {
    
    associatedtype BuildingType
    
    init()
    
    func build() -> BuildingType
    
}
