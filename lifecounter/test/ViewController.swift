//
//  ViewController.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import UIKit

class ViewController: UIViewController, PlayerViewDelegate {

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
        playerView.delegate = self
        
        if playerViews.count < 4 {
            firstRowStackView.addArrangedSubview(playerView)
        } else if playerViews.count < 8 {
            secondRowStackView.addArrangedSubview(playerView)
        } else {
            return
        }
    
        playerViews.append(playerView)
    }
    
    func removePlayerView() {
        if playerViews.count <= 2 {
            return
        } else {
            guard let lastPlayerView = playerViews.last else {
                return
            }
            lastPlayerView.removeFromSuperview()
            playerViews.removeLast()
        }
    }
    
    func playerLost(_ playerView: PlayerView) {
        if let index = playerViews.firstIndex(of: playerView) {
            gameOverText.text = "Player \(index + 1) LOSES!"
            gameOverText.isHidden = false
        }
    }
    
    @IBAction func addPlayer(_ sender: Any) {
        addPlayerView()
        print("Added Player")
        print(playerViews.count)
    }
    
    @IBAction func removePlayer(_ sender: Any) {
        removePlayerView()
    }

}

