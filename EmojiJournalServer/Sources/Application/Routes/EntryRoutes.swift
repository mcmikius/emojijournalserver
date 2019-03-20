//
//  EntryRoutes.swift
//  Application
//
//  Created by Michail Bondarenko on 3/20/19.
//

import Foundation
import Kitura
import LoggerAPI
import KituraContracts

private var dataStore = [String: JournalEntry]()

func initializeEntryRoutes(app: App) {
    app.router.get("/entries", handler: getAllEntries)
    Log.info("Journal Entry Routes Created")
}

func getAllEntries(completion: @escaping ([JournalEntry]?, RequestError?) -> Void) {
    let entries = dataStore.map { $0.value }
    completion(entries, nil)
}

