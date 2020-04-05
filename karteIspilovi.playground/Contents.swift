import UIKit

import Foundation
class Card {
    var name = ""
    var count = 0
    init(name: String) {
        self.name = name
    }
}
var aceOfHearts = Card(name: "aceOfHearts")
var aceOfSpades = Card(name: "aceOfSpades")
var aceOfClubs = Card(name: "aceOfClubs")
var aceOfDiamonds = Card(name: "aceOfDiamonds")
var queenOfClubs = Card(name: "queenOfClubs")
var queenOfHearts = Card(name: "queenOfHearts")
var queenOfDiamonds = Card(name: "queenOfDiamonds")
var queenOfSpades = Card(name: "queenOfSpades")
var kingOfClubs = Card(name: "kingOfClubs")
var kingOfSpades = Card(name: "kingOfSpades")
var kingOfDiamonds = Card(name: "kingOfDiamonds")
var kingOfHearts = Card(name: "kingOfHearts")
var jackOfSpades = Card(name: "jackOfSpades")
var jackOfHearts = Card(name: "jackOfHearts")
var jackOfDiamonds = Card(name: "jackOfDiamonds")
var jackOfClubs = Card(name: "jackOfClubs")
var tenOfHearts = Card(name: "tenOfHearts")
var tenOfSpades = Card(name: "tenOfSpades")
var tenOfClubs = Card(name: "tenOfClubs")
var tenOfDiamonds = Card(name: "tenOfDiamonds")
var nineOfClubs = Card(name: "nineOfClubs")
var nineOfDiamonds = Card(name: "nineOfDiamonds")
var nineOfSpades = Card(name: "nineOfSpades")
var nineOfHearts = Card(name: "nineOfHearts")
var eightOfSpades = Card(name: "eightOfSpades")
var eightOfHearts = Card(name: "eightOfHearts")
var eightOfDiamonds = Card(name: "eightOfDiamonds")
var eightOfClubs = Card(name: "eightOfClubs")
var sevenOfClubs = Card(name: "sevenOfClubs")
var sevenOfDiamonds = Card(name: "sevenOfDiamonds")
var sevenOfHearts = Card(name: "sevenOfHearts")
var sevenOfSpades = Card(name: "sevenOfSpades")
var cards = [aceOfHearts, aceOfSpades, aceOfClubs, aceOfDiamonds, queenOfClubs, queenOfHearts, queenOfDiamonds, queenOfSpades,
 kingOfClubs, kingOfSpades, kingOfDiamonds, kingOfHearts, jackOfSpades, jackOfHearts, jackOfDiamonds, jackOfClubs, tenOfHearts,
 tenOfSpades, tenOfClubs, tenOfDiamonds, nineOfClubs, nineOfDiamonds, nineOfSpades, nineOfHearts, eightOfSpades, eightOfHearts,
 eightOfDiamonds, eightOfClubs, sevenOfClubs, sevenOfDiamonds, sevenOfHearts, sevenOfSpades]
var n = 500
var randomCards = [Card]()
for _ in 1...n {
    let randomInt = Int.random(in: 0...31)
    randomCards.append(cards[randomInt])
}
var i = 0
while i < n {
        if randomCards[i].name == "aceOfHearts" {
        aceOfHearts.count+=1
        }
        if randomCards[i].name == "aceOfSpades" {
        aceOfSpades.count+=1
        }
        if randomCards[i].name == "aceOfDiamonds" {
        aceOfDiamonds.count+=1
        }
        if randomCards[i].name == "aceOfClubs" {
        aceOfClubs.count+=1
        }
        if randomCards[i].name == "kingOfClubs" {
        kingOfClubs.count+=1
        }
        if randomCards[i].name == "kingOfDiamonds" {
        kingOfDiamonds.count+=1
        }
        if randomCards[i].name == "kingOfSpades" {
        kingOfSpades.count+=1
        }
        if randomCards[i].name == "kingOfHearts" {
        kingOfHearts.count+=1
        }
        if randomCards[i].name == "queenOfHearts" {
        queenOfHearts.count+=1
        }
        if randomCards[i].name == "queenOfDiamonds" {
        queenOfDiamonds.count+=1
        }
        if randomCards[i].name == "queenOfSpades" {
        queenOfSpades.count+=1
        }
        if randomCards[i].name == "queenOfClubs" {
        queenOfClubs.count+=1
        }
        if randomCards[i].name == "jackOfHearts" {
        jackOfHearts.count+=1
        }
        if randomCards[i].name == "jackOfSpades" {
        jackOfSpades.count+=1
        }
        if randomCards[i].name == "jackOfDiamonds" {
        jackOfDiamonds.count+=1
        }
        if randomCards[i].name == "jackOfClubs" {
        jackOfClubs.count+=1
        }
        if randomCards[i].name == "tenOfSpades" {
        tenOfSpades.count+=1
        }
        if randomCards[i].name == "tenOfClubs" {
        tenOfClubs.count+=1
        }
        if randomCards[i].name == "tenOfDiamonds" {
        tenOfDiamonds.count+=1
        }
        if randomCards[i].name == "tenOfHearts" {
        tenOfHearts.count+=1
        }
        if randomCards[i].name == "nineOfHearts" {
        nineOfHearts.count+=1
        }
        if randomCards[i].name == "nineOfSpades" {
        nineOfSpades.count+=1
        }
        if randomCards[i].name == "nineOfDiamonds" {
        nineOfDiamonds.count+=1
        }
        if randomCards[i].name == "nineOfClubs" {
        nineOfClubs.count+=1
        }
        if randomCards[i].name == "eightOfSpades" {
        eightOfSpades.count+=1
        }
        if randomCards[i].name == "eightOfDiamonds" {
        eightOfDiamonds.count+=1
        }
        if randomCards[i].name == "eightOfClubs" {
        eightOfClubs.count+=1
        }
        if randomCards[i].name == "eightOfHearts" {
        eightOfHearts.count+=1
        }
        if randomCards[i].name == "sevenOfClubs" {
        sevenOfClubs.count+=1
        }
        if randomCards[i].name == "sevenOfHearts" {
        sevenOfHearts.count+=1
        }
        if randomCards[i].name == "sevenOfSpades" {
        sevenOfSpades.count+=1
        }
        if randomCards[i].name == "sevenOfDiamonds" {
        sevenOfDiamonds.count+=1
        }
    i += 1
}
var min = Int.max
for card in cards {
    if (card.count < min) {
        min = card.count
    }
}
print("Moze se napraviti najvise \(min) spilova.")
