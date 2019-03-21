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

// MARK: - Date display
extension Date {
    var iso8601: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        
        return dateFormatter.string(from: self).appending("Z")
    }
    
    var displayDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: self)
    }
    
    var displayTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .long
        return dateFormatter.string(from: self)
    }
}

// MARK: - JournalEntry Equatable
extension JournalEntry: Equatable {
    public static func == (lhs: JournalEntry, rhs: JournalEntry) -> Bool {
        return lhs.date == rhs.date
    }
}

