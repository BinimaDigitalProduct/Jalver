//
//  Jalver.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

final class Jalver {
    
    class func resolve<T where T: Resolver>(type: T.Type) -> T {
        let solved = T.resolve()
        return solved
    }
    
    class func resolve<T where T: Configurator>(configurator: T.Type) -> T.Configured {
        let configured = T.configure()
        return configured
    }
    
}