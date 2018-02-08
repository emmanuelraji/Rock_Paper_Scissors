//
//  Sign.swift
//  RPS
//
//  Created by Emmanuel Raji on 2/6/18.
//  Copyright © 2018 Emmanuel Raji. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emojiOfSign: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        }
    }
    
    func playAgainst(_ other: Sign) -> GameState {
        if self == .rock && other == .scissors {
            return GameState.win
        } else if self == .rock && other == .paper {
            return GameState.lose
        } else if self == .paper && other == .scissors {
            return GameState.lose
        } else if self == .paper && other == .rock {
            return GameState.win
        } else if self == .scissors && other == .rock {
            return GameState.lose
        } else if self == .scissors && other == .paper {
            return GameState.win
        }
        return GameState.draw
    }
}


