//
//  Card.swift
//  Concentration
//
//  Created by Ramy Zhang on 2019-12-28.
//  Copyright © 2019 Ramy Zhang. All rights reserved.
//

import Foundation

struct Card {
    // Structs are value types, meaning they're copied
    // every time they get used.
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return Card.identifierFactory
    }
    
    var identifier: Int
    var isFaceUp = false
    var isMatched = false
    
    // This is to initialize the identifier, so that a new card
    // can be easily created without re-initializing in the Concentration class.
    init() {
        // Self means this struct's identifier (so the global var inside the struct)
        self.identifier = Card.getUniqueIdentifier()
    }
}
