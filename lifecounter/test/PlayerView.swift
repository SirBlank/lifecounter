//
//  PlayerView.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import UIKit

protocol PlayerViewDelegate: AnyObject {
    func playerLost(_ playerView: PlayerView)
}

class PlayerView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var plusOneBtn: UIButton!
    @IBOutlet weak var minusOneBtn: UIButton!
    @IBOutlet weak var valueText: UITextField!
    @IBOutlet weak var plusValueBtn: UIButton!
    @IBOutlet weak var minusValueBtn: UIButton!
    @IBOutlet weak var plusValueText: UIButton!
    @IBOutlet weak var minusValueText: UIButton!
    
    weak var viewDelegate: PlayerViewDelegate?
    var lifeChanged = false
    var isDead = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    var lifeCount: Int = 20 {
        didSet {
            let diff = lifeCount - oldValue
            if diff > 0 {
                HistoryLog.add("\(nameLabel.text ?? "Player") gained \(diff) life.")
            } else if diff < 0 {
                HistoryLog.add("\(nameLabel?.text ?? "Player") lost \(-diff) life.")
            }
            lifeLabel?.text = "Life: \(lifeCount)"
            if lifeCount <= 0 {
                isDead = true
                HistoryLog.add("\(nameLabel.text ?? "Player") has been defeated!")
                viewDelegate?.playerLost(self)
            }
        }
    }
    
    var lifeValue = 0
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "PlayerView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configureView(name: String) {
        self.nameLabel.text = name
    }
    
    func updateButtonLabels() {
        guard let value = Int(valueText.text ?? "") else {
            plusValueBtn.setTitle("+", for: .normal)
            minusValueBtn.setTitle("-", for: .normal)
            return
        }
        
        lifeValue = value
        plusValueBtn.setTitle("+\(value)", for: .normal)
        minusValueBtn.setTitle("-\(value)", for: .normal)
    }
    
    @IBAction func plusOne(_ sender: Any) {
        if isDead == false {
            lifeCount += 1
            lifeChanged = true
        }
    }
    
    @IBAction func minusOne(_ sender: Any) {
        if isDead == false {
            lifeCount -= 1
            lifeChanged = true
        }
    }
    
    @IBAction func changeValue(_ sender: Any) {
        updateButtonLabels()
    }

    @IBAction func addValue(_ sender: Any) {
        if isDead == false {
            lifeCount += lifeValue
            lifeChanged = true
        }
    }
    
    @IBAction func minusValue(_ sender: Any) {
        if isDead == false {
            lifeCount -= lifeValue
            lifeChanged = true
        }
    }
    
}
