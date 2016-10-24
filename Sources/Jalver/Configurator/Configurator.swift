//
//  Configurator.swift
//  Jalver
//
//  Created by Julian Alonso on 25/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

public protocol Configurator {
    
    associatedtype Configured
    
    init()
    
    func configure() -> Configured
    
}
