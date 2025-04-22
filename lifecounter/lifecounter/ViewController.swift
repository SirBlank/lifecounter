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
    }
    
    @IBOutlet weak var playersStackView: UIStackView!
    
    var playerViews = [PlayerView]()
    
    func addPlayerView() {
        let playerView = PlayerView(frame: CGRect(x: 0, y: 0, width: 241.5, height: 380))
        
        playerView.nameLabel?.text = "Player \(playerViews.count + 1)"
        playersStackView.addSubview(playerView)
        playerViews.append(playerView)
    }
    
    func removePlayerView() {
        guard let lastPlayerView = playerViews.last else {
            return
        }
        lastPlayerView.removeFromSuperview()
        playerViews.removeLast()
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

