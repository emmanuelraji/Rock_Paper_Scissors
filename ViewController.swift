//
//  ViewController.swift
//  RPS
//
//  Created by Emmanuel Raji on 2/6/18.
//  Copyright © 2018 Emmanuel Raji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(GameState.start)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var playerRock: UIButton!
    @IBOutlet weak var playerPaper: UIButton!
    @IBOutlet weak var playerScissors: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playerRock(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func playerPaper(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func playerScissors(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(GameState.start)
    }
    
    func updateUI(_ gameState: GameState) {
        
        
        if gameState == GameState.start {
            gameStatus.text = gameState.gameStateText
            appSign.text = "🤖"
            playAgain.isHidden = true
            playerRock.isEnabled = true
            playerPaper.isEnabled = true
            playerScissors.isEnabled = true
            playerPaper.isHidden = false
            playerScissors.isHidden = false
            playerRock.isHidden = false
            view.backgroundColor = UIColor(red: 255/255, green: 209/255, blue: 195/255, alpha: 1)
        } else if gameState == GameState.win {
            gameStatus.text = gameState.gameStateText
            view.backgroundColor = UIColor(red: 173/255, green: 213/255, blue: 157/255, alpha: 1)
        } else if gameState == GameState.lose {
            gameStatus.text = gameState.gameStateText
            view.backgroundColor = UIColor(red: 173/255, green: 213/255, blue: 157/255, alpha: 1)
        } else if gameState == GameState.draw {
            gameStatus.text = gameState.gameStateText
            view.backgroundColor = UIColor(red: 173/255, green: 213/255, blue: 157/255, alpha: 1)
        }
    }
    
    func play(_ game: Sign) {
        let randomComputerSign = randomSign()
        let gameResult = game.playAgainst(randomComputerSign)
        updateUI(gameResult)
        appSign.text = randomComputerSign.emojiOfSign
        playerRock.isEnabled = false
        playerPaper.isEnabled = false
        playerScissors.isEnabled = false
        playAgain.isHidden = false
        
        if game.emojiOfSign == "👊" {
            playerPaper.isHidden = true
            playerScissors.isHidden = true
        } else if game.emojiOfSign == "✌️" {
            playerPaper.isHidden = true
            playerRock.isHidden = true
        } else if game.emojiOfSign == "🖐" {
            playerRock.isHidden = true
            playerScissors.isHidden = true
        }
    }
}


