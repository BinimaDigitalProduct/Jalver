//
//  Key.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

public struct Key {
    
    let type: Any.Type
    var tag: Tag?
    
}

extension Key: Hashable {
    
    var hashValue: Int {
        return "\(self.type)-\(self.tag)".hashValue
    }
    
}

extension Key: Equatable {
    
    static public func ==(lhs: Key, rhs: Key) -> Bool {
        return lhs.type == rhs.type && lhs.tag == rhs.tag
    }
    
}
