//
//  STNode.swift
//  SuperTrie
//
//  Created by Alexandre Lopoukhine on 23/03/2015.
//  Copyright (c) 2015 bluetatami. All rights reserved.
//

import Foundation

public final class STNode<N, E: Hashable> {
    typealias EdgeValueType = E
    typealias NodeValueType = N
    
    // Only accepting nodes have values
    public var nodeValue: N?
    public var nextNodeDict: [E:STNode<N,E>] = [:]
    
    init(value: N?) {
        self.nodeValue = value
    }
}
