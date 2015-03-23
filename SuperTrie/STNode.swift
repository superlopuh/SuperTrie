//
//  STNode.swift
//  SuperTrie
//
//  Created by Alexandre Lopoukhine on 23/03/2015.
//  Copyright (c) 2015 bluetatami. All rights reserved.
//

import Foundation

class STNode<E: Hashable, N> {
    typealias EdgeValueType = E
    typealias NodeValueType = N
    
    var accepting: Bool
    let nodeValue: N
    var nextNodeDict: [E:N] = [:]
    
    init(accepting: Bool, value: N) {
        self.accepting = accepting
        self.nodeValue = value
    }
}
