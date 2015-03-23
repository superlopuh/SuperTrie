//
//  STNode.swift
//  SuperTrie
//
//  Created by Alexandre Lopoukhine on 23/03/2015.
//  Copyright (c) 2015 bluetatami. All rights reserved.
//

import Foundation

class STNode<N, E: Hashable> {
    typealias EdgeValueType = E
    typealias NodeValueType = N
    
    // Only accepting nodes have values
    let nodeValue: N?
    var nextNodeDict: [E:STNode<N,E>] = [:]
    
    init(value: N?) {
        self.nodeValue = value
    }
}
