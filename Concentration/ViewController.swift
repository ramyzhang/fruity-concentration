//
//  ViewController.swift
//  Concentration
//
//  Created by Ramy Zhang on 2019-12-25.
//  Copyright © 2019 Ramy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfCardPairs: (cardArray.count + 1) / 2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
            // print("\(flipCount)")
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardArray: [UIButton]!
        
    @IBAction func newGame(_ sender: UIButton) {
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        // .index is a method that returns an optional, not just an int
        // this means that it is an enum with two states: set and not set
        // if the state is set, then it returns some associated data, which is the index of the cardArray here
        // if not, then it returns nil
        // this if statement allows you to filter out set optional and return only the associated data
        if let cardNumber = cardArray.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel(at: cardNumber)
        } else {
            print("Add this card to the array!")
        }
    }
    
    func updateViewFromModel(at index: Int) {
        for index in cardArray.indices {
            let button = cardArray[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            }
        }
    }
    
    var emojiArray = ["🍉", "🍒", "🍓", "🍇", "🍎", "🍊", "🍑", "🌺"]
    var emoji = [Int:String]()
    
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiArray.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiArray.count)))
                emoji[card.identifier] = emojiArray.remove(at: randomIndex)
            }
        }
        if let chosenEmoji = emoji[card.identifier] {
            return chosenEmoji
        } else {
            return "?"
        }
    }

}

