//
//  HistoryViewController.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyText: UILabel!
    
    override func viewDidLoad() {
        updateLog()
        super.viewDidLoad()
    }
    
    func updateLog() {
        historyText.numberOfLines = HistoryLog.numberOfLines()
        historyText.text = HistoryLog.allLogs().joined(separator: "\n")
        print(historyText.text ?? "Nothing here")
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
