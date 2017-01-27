//
//  Jalver.swift
//  Jalver
//
//  Created by Julian Alonso on 23/2/16.
//  Copyright © 2016 Jalver. All rights reserved.
//

import Foundation
import UIKit

public final class Jalver {
    
//    static var instances: [String: Any] = [:]
    
//    public class func resolve<T>(_ configurator: T.Type, with: (_ configurator: inout T) -> Void = { _ in }) -> T.Configured where T: Configurator {
//        var configured: T.Configured!
//        var created = configurator.init()
//        with(&created)
//        
//        switch created.scope {
//        case .default:
//            configured = created.configure()
//        case .singleton:
//            configured = self.createOrGetInstance(of: created)
//        }
//        
//        return configured
//    }
//    
//    private class func createOrGetInstance<T>(of: T) -> T.Configured where T: Configurator {
//        var configured: T.Configured!
//        if let retrieved = Jalver.instances[name(of)] {
//            configured = retrieved as! T.Configured
//        } else {
//            configured = of.configure()
//            Jalver.instances[name(of)] = configured
//        }
//        return configured
//    }
    
    
    private class func name<T: Configurator>(_ configurator: T) -> String {
        return "\(type(of: configurator))"
    }
}
