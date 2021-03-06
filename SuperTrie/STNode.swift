//
//  STNode.swift
//  SuperTrie
//
//  Created by Alexandre Lopoukhine on 23/03/2015.
//  Copyright (c) 2015 bluetatami. All rights reserved.
//

public final class STNode<N, E: Hashable> {
    typealias EdgeValueType = E
    typealias NodeValueType = N
    
    // Only accepting nodes have values
    public var nodeValue: N?
    public var nextNodeDict: [E:STNode<N,E>] = [:]
    
    init(value: N? = nil) {
        self.nodeValue = value
    }
}

public extension STNode {
    public func addWord<W : SequenceType where W.Generator.Element == E>(word: W, nodeValue: N) {
        addWord(word.generate(), nodeValue: nodeValue)
    }
    
    public func addWord<WG: GeneratorType where WG.Element == E>(var wordGenerator: WG, nodeValue: N) {
        if let nextCharacter = wordGenerator.next() {
            // Add child for nextCharacter if it doesn't exist
            if nil == nextNodeDict[nextCharacter] {
                nextNodeDict[nextCharacter] = STNode<N,E>()
            }
            
            // Add what is left of the word to the child
            nextNodeDict[nextCharacter]!.addWord(wordGenerator, nodeValue: nodeValue)
        } else {
            // Add empty string, or, make accepting
            self.nodeValue = nodeValue
        }
    }
}

public extension STNode {
    public convenience init<W: SequenceType, WPS: SequenceType where W.Generator.Element == E, WPS.Generator.Element == (N,W)>(wordPairs: WPS) {
        self.init()
        addWordPairs(wordPairs)
    }
    
    public func addWordPairs<W: SequenceType, WPS: SequenceType where W.Generator.Element == E, WPS.Generator.Element == (N,W)>(wordPairs: WPS) {
        for (nodeValue, word) in wordPairs {
            addWord(word, nodeValue: nodeValue)
        }
    }
}
