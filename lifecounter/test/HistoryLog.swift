//
//  HistoryLog.swift
//  test
//
//  Created by Amber Wu on 4/22/25.
//

import Foundation

class HistoryLog {
    private static var logs: [String] = []
    
    static func add(_ entry: String) {
        print("Added entry!")
        logs.append(entry)
    }
    
    static func allLogs() -> [String] {
        return logs
    }
    
    static func clear() {
        logs.removeAll()
    }
}
