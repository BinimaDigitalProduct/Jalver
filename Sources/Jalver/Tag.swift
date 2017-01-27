//
//  Tag.swift
//  Pods
//
//  Created by Julián Alonso Carballo on 27/1/17.
//
//

import Foundation

public struct Tag {
    
    let tag: String
    
}

extension Tag: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.tag = value
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.tag = value
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.tag = value
    }
}

extension Tag: Equatable {
    static public func ==(lhs: Tag, rhs: Tag) -> Bool {
        return lhs.tag == rhs.tag
    }
}

