//
//  HistoryViewController.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyText.text = HistoryLog.allLogs().joined(separator: "\n")
        print(HistoryLog.allLogs())
        print(historyText.text ?? "nothing here")
        print(historyText ?? "nothing here")
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
