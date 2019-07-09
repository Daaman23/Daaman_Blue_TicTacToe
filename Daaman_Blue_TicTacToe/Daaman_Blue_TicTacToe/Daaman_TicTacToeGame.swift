//
//  Daaman_TicTacToeGame.swift
//  Daaman_Blue_TicTacToe
//
//  Created by Daaman Kaushal on 2019-06-04.
//  Copyright © 2019 Daaman Kaushal. All rights reserved.
//

import Foundation

class Daaman_TicTacToeGame {
    
    var whoseTurnIsIt = "X"
    var squareContents = Array(repeating: "", count: 9)
    var numberOfMovesPlayed = 0
    var gameWinner = ""
    
    var isPastGame = false
    
    var orderPlayed = [Int]()
    let winningCombos = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]
    
    func playMove(_ tag: Int) {
        numberOfMovesPlayed += 1
        
        orderPlayed.append(tag)
        
        let location = tag - 1
        if (whoseTurnIsIt == "X") {
            // x Marked
            squareContents[location] = "X"
            whoseTurnIsIt = "0"
        } else {
            // 0 marked
            squareContents[location] = "0"
            whoseTurnIsIt = "X"
        }
    }
    
    func checkIfGameOver() -> Bool {
        let checkFor = whoseTurnIsIt == "X" ? "0" : "X"
        
        for winningCombo in winningCombos {
            if (squareContents[winningCombo[0]] == checkFor
            && squareContents[winningCombo[1]] == checkFor
                && squareContents[winningCombo[2]] == checkFor) {
                gameWinner = checkFor
                saveGame(whoWon: checkFor)
                return true
                
            }
            
            
        }
        
        if (numberOfMovesPlayed == 9) {
            gameWinner = "Draw"
            saveGame(whoWon: "Draw")
            return true
        }
        return false
        
    }
    // save game
    func saveGame(whoWon: String) {
        if (isPastGame){
            return
        }
        let numberOfGamesPlayed =
            UserDefaults.standard.integer(forKey: Constants.NUMBER_OF_GAMES_PLAYED) + 1
        UserDefaults.standard.set(numberOfGamesPlayed, forKey:
        Constants.NUMBER_OF_GAMES_PLAYED)
        
        UserDefaults.standard.set(whoWon, forKey: Constants.WHO_WON +
        String(numberOfGamesPlayed))
        
        let currentTime = Date().timeIntervalSince1970
        
        UserDefaults.standard.set(currentTime, forKey: Constants.GAME_TIMESTAMP + String(numberOfGamesPlayed))
        
        UserDefaults.standard.set(orderPlayed, forKey: Constants.ORDER_OF_MOVES + String(numberOfGamesPlayed))
        
        print (numberOfGamesPlayed)
        print (whoWon)
        print (currentTime)
        
        
    }
    
}
struct Constants {
    static let NUMBER_OF_GAMES_PLAYED = "num_games"
    static let WHO_WON = "who_won"
    static let GAME_TIMESTAMP = "game_timestamp_"
    static let ORDER_OF_MOVES =  "order_of_moves"
}
