//
//  EntryRoutes.swift
//  Application
//
//  Created by Michail Bondarenko on 3/20/19.
//

import Foundation
import LoggerAPI
import KituraContracts

private var dataStore = [String: JournalEntry]()

func initializeEntryRoutes(app: App) {
    app.router.get("/entries", handler: getAllEntries)
    app.router.post("/entries", handler: addEntry)
    
    Log.info("Journal entry routes created")
}

func getAllEntries(completion: @escaping ([JournalEntry]?, RequestError?) -> Void) -> Void {
    let entries = dataStore.map{ $0.value }
    completion(entries, nil)
}

func addEntry(entry: JournalEntry, completion: @escaping (JournalEntry?, RequestError?) -> Void) {
    var newEntry = entry
    newEntry.id = String(dataStore.count + 1)
    dataStore[newEntry.id!] = newEntry
    completion(newEntry, nil)
}
