//
//  Jalver.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation

public final class Jalver {
    
    public class func resolve<T where T: Resolver>(type: T.Type) -> T {
        let solved = T.resolve()
        return solved
    }
    
    public class func resolve<T where T: Configurator>(configurator: T.Type) -> T.Configured {
        let configured = T.configure()
        return configured
    }
    
}