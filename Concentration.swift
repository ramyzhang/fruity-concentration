//
//  Concentration.swift
//  Concentration
//
//  Created by Ramy Zhang on 2019-12-27.
//  Copyright © 2019 Ramy Zhang. All rights reserved.
//

import Foundation

class Concentration {
    // Classes are reference types, meaning every time you use
    // them, you're actually creating a pointer back to the class.
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        // This function contains all of the Concentration game logic.
        // Because you've already enabled the controller to change cards to
        // transparent once they've been matched, the model can simply toy
        // around with the booleans in order for the game to work.
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                // either no cards or 2 cards face up
            }
        }
    }
    
    // Initializes a Concentration game, loads up cards in the cards array.
    init(numberOfCardPairs: Int) {
        // For loops in Swift are iterated in SEQUENCES. 
        for _ in 1...numberOfCardPairs {
            // Creating a new card...
            let card = Card()
            cards += [card, card]
        }
        // TODO: SHUFFLE CARDS!
    }
    
}
