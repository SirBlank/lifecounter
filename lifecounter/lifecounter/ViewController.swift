//
//  ViewController.swift
//  lifecounter
//
//  Created by Amber Wu on 4/16/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkPlayerLife()
    }
    
    @IBOutlet weak var player1LifeCount: UILabel!
    
    @IBOutlet weak var player2LifeCount: UILabel!
    
    @IBOutlet weak var gameOverText: UILabel!
    
    var player1Life = 20
    var player2Life = 20
    
    func checkPlayerLife() {
        if player1Life <= 0 {
            gameOverText.text = "Player 1 LOSES!"
            gameOverText.isHidden = false
        } else if player2Life <= 0 {
            gameOverText.text = "Player 2 LOSES!"
            gameOverText.isHidden = false
        } else {
            gameOverText.isHidden = true
        }
    }

    @IBAction func player1AddOne(_ sender: Any) {
        player1Life += 1
        player1LifeCount.text = "Life: \(player1Life)"
        checkPlayerLife()
    }
    
    @IBAction func player1AddFive(_ sender: Any) {
        player1Life += 5
        player1LifeCount.text = "Life: \(player1Life)"
        checkPlayerLife()
    }
    
    @IBAction func player1RemoveOne(_ sender: Any) {
        player1Life -= 1
        player1LifeCount.text = "Life: \(player1Life)"
        checkPlayerLife()
    }
    
    @IBAction func player1RemoveFive(_ sender: Any) {
        player1Life -= 5
        player1LifeCount.text = "Life: \(player1Life)"
        checkPlayerLife()
    }
    
    @IBAction func player2AddOne(_ sender: Any) {
        player2Life += 1
        player2LifeCount.text = "Life: \(player2Life)"
        checkPlayerLife()
    }
    
    @IBAction func player2AddFive(_ sender: Any) {
        player2Life += 5
        player2LifeCount.text = "Life: \(player2Life)"
        checkPlayerLife()
    }
    
    @IBAction func player2RemoveOne(_ sender: Any) {
        player2Life -= 1
        player2LifeCount.text = "Life: \(player2Life)"
        checkPlayerLife()
    }
    
    @IBAction func player2RemoveFive(_ sender: Any) {
        player2Life -= 5
        player2LifeCount.text = "Life: \(player2Life)"
        checkPlayerLife()
    }
}

