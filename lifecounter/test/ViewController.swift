//
//  ViewController.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import UIKit

class ViewController: UIViewController, PlayerViewDelegate{

    @IBOutlet weak var firstRowStackView: UIStackView!
    @IBOutlet weak var secondRowStackView: UIStackView!
    @IBOutlet weak var gameOverText: UILabel!
    
    var playerViews = [PlayerView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOverText.isHidden = true
        
        addPlayerView()
        addPlayerView()
        addPlayerView()
        addPlayerView()
    }
    
    func addPlayerView() {
        let playerView = PlayerView(frame: CGRect(x: 0, y: 0, width: 241.5, height: 380))
        
        playerView.nameLabel?.text = "Player \(playerViews.count + 1)"
        playerView.viewDelegate = self
        
        if playerViews.count < 4 {
            print("Player added")
            firstRowStackView.addArrangedSubview(playerView)
        } else if playerViews.count < 8 {
            print("Player added")
            secondRowStackView.addArrangedSubview(playerView)
        } else {
            print("Cannot add player as player count cannot be greater than 8.")
            return
        }
    
        playerViews.append(playerView)
    }
    
    func removePlayerView() {
        if playerViews.count <= 2 {
            print("Cannot remove player as player count cannot be less than 2.")
            return
        } else {
            guard let lastPlayerView = playerViews.last else {
                return
            }
            lastPlayerView.removeFromSuperview()
            playerViews.removeLast()
            print("Player removed")
            print(playerViews.count)
        }
    }
    
    func playerLost(_ playerView: PlayerView) {
        if let index = playerViews.firstIndex(of: playerView) {
            gameOverText.text = "Player \(index + 1) LOSES!"
            gameOverText.isHidden = false
        }
    }
    
    func checkLifeChanged() -> Bool {
        for playerView in playerViews {
            if playerView.lifeChanged == true {
                return true
            }
        }
        return false
    }
    
    @IBAction func addPlayer(_ sender: Any) {
        if checkLifeChanged() == true {
            gameOverText.isHidden = false
            gameOverText.text = "Game in progress..."
            return
        } else {
            addPlayerView()
        }
    }
    
    @IBAction func removePlayer(_ sender: Any) {
        if checkLifeChanged() == true {
            gameOverText.isHidden = false
            gameOverText.text = "Game in progress..."
            return
        } else {
            removePlayerView()
        }
    }

}

