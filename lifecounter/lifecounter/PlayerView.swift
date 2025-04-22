//
//  PlayerView.swift
//  lifecounter
//
//  Created by Amber Wu on 4/21/25.
//

import UIKit

class PlayerView: UIView {
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var lifeLabel: UILabel?
    @IBOutlet weak var plusOneBtn: UIButton?
    @IBOutlet weak var minusOneBtn: UIButton?
    @IBOutlet weak var valueText: UITextField?
    @IBOutlet weak var plusValueBtn: UIButton?
    @IBOutlet weak var minusValueBtn: UIButton?
    
    var lifeCount: Int = 20 {
        didSet {
            lifeLabel?.text = "Life: \(lifeCount)"
        }
    }
    
    @IBAction func plusOne(_ sender: Any) {
        lifeCount += 1
    }
    
    @IBAction func minusOne(_ sender: Any) {
        lifeCount -= 1
    }
    

}
