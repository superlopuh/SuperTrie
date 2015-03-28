//
//  STTrie.swift
//  SuperTrie
//
//  Created by Alexandre Lopoukhine on 23/03/2015.
//  Copyright (c) 2015 bluetatami. All rights reserved.
//

import Foundation

public class STTrie<N, E: Hashable> {
    typealias EdgeValueType = E
    typealias NodeValueType = N
    
    public let root = STNode<N, E>(value: nil)
    
    public init() {
        
    }
    
    public init<W: SequenceType, WPS: SequenceType where W.Generator.Element == E, WPS.Generator.Element == (N,W)>(wordPairs: WPS) {
        for (nodeValue, word) in wordPairs {
            addWord(word, nodeValue: nodeValue)
        }
    }
    
    public func addWord<W : SequenceType where W.Generator.Element == E>(word: W, nodeValue: N) {
        var currentNode = root
        var gen = word.generate()
        
        while let character = gen.next() {
            if currentNode.nextNodeDict[character] == nil {
                // No child for this edge
                let newNode = STNode<N,E>(value: nil)
                currentNode.nextNodeDict[character] = newNode
            }
            currentNode = currentNode.nextNodeDict[character]!
        }
        
        currentNode.nodeValue = nodeValue
    }
}
