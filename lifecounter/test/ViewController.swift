//
//  ViewController.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstRowStackView: UIStackView!
    @IBOutlet weak var secondRowStackView: UIStackView!
    
    var playerViews = [PlayerView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addPlayerView() {
        let playerView = PlayerView(frame: CGRect(x: 0, y: 0, width: 241.5, height: 380))
        
        playerView.nameLabel?.text = "Player \(playerViews.count + 1)"
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

