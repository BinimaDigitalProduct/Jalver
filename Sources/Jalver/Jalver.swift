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
        var solved = type.resolve()
        solved.postInit()
        return solved
    }
    
    public class func resolve<T where T: Configurator>(configurator: T.Type, with: (inout configurator: T) -> Void = { _ in }) -> T.Configured {
        var created = configurator.init()
        with(configurator: &created)
        return created.configure()
    }
    
}
