//
//  PlayerView.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import UIKit

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "PlayerView") else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configureView(name: String) {
        self.nameLabel.text = name
    }
    
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
