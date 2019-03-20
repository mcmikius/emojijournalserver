//
//  JournalEntry.swift
//  Application
//
//  Created by Michail Bondarenko on 3/20/19.
//

import Foundation

struct JournalEntry: Codable {
    var id: String?
    var emoji: String
    var date: Date
    
    init?(id: String?, emoji: String, date: Date) {
        if emoji.isEmpty {
            return nil
        }
        self.id = id
        self.emoji = emoji
        self.date = date
    }
}
extension Date {
    var iso8601: String {
        let dateFormatter = DateFormatter()
    }
}
