//
//  GameState.swift
//  RPS
//
//  Created by Emmanuel Raji on 2/6/18.
//  Copyright © 2018 Emmanuel Raji. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var gameStateText: String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Won!"
        case .lose:
            return "You Lost!"
        case .draw:
            return "Draw!"
        }
    }
}
