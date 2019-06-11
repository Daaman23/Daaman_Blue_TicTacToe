//
//  Daaman_GameViewController.swift
//  Daaman_Blue_TicTacToe
//
//  Created by Daaman Kaushal on 2019-05-28.
//  Copyright © 2019 Daaman Kaushal. All rights reserved.
//

import UIKit

class Daaman_GameViewController: UIViewController {
    
var theGameModel = Daaman_TicTacToeGame()
    var gameIsOver = false
    
    
    @IBOutlet weak var whoIsNext: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func squareTouched(_ sender: UIButton) {
        print("Buttons touched! but which one?" )
        print(sender . tag)
    
    
        if (sender.currentTitle == nil && !gameIsOver) {
            sender.setTitle(theGameModel.whoseTurnIsIt, for: .normal)
    theGameModel.playMove(sender . tag )
            
            if (theGameModel.checkIfGameOver()) {
                if (theGameModel.gameWinner == "Draw") {
                    whoIsNext.text = "Draw!"
                } else {
                whoIsNext.text = theGameModel.gameWinner + "Won!"
                }
                gameIsOver = true
            }else {
            whoIsNext.text = theGameModel.whoseTurnIsIt + "'s Turn"
    
    }
        
    }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
