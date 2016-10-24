//
//  Jalver.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation
import UIKit

private let javer = Jalver()

public final class Jalver {
    
    public class func resolve<T>(_ type: T.Type) -> T where T: Resolver {
        var solved = type.resolve()
        solved.postInit()
        return solved
    }
    
    public class func resolve<T>(_ configurator: T.Type, with: (_ configurator: inout T) -> Void = { _ in }) -> T.Configured where T: Configurator {
        var created = configurator.init()
        with(&created)
        return created.configure()
    }
    
}
