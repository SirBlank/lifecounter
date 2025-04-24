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
        print("Entry added!")
        logs.append(entry)
    }
    
    static func numberOfLines() -> Int {
        return logs.count
    }
    
    static func allLogs() -> [String] {
        return logs
    }
    
    static func clear() {
        logs.removeAll()
    }
}
