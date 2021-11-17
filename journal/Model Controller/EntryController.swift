//
//  EntryController.swift
//  journal
//
//  Created by Tanner Perry on 11/16/21.
//

import Foundation

class EntryController {
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    
    func createEntry(title: String, body: String, time: Date) {
        let newEntry = Entry(title: title, body: body, timeStamp: time)
        entries.append(newEntry)
        saveToPersistanceStore()
        
    }
    
    func deleteEntry(entry: Entry){
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistanceStore()
    }
    
    //MARK: persistance
    
   private func persistantStore() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileUrl = urls[0].appendingPathComponent("journal.json")
        return fileUrl
    }
    
    func saveToPersistanceStore() {
        do {
            let data = try JSONEncoder().encode(entries)
            try data.write(to: persistantStore())
        } catch let saveError {
            print("we had an error saving to out persistance store.")
            print(saveError)
            print(saveError.localizedDescription)
            
        }
    }
    
    // Load
    func loadFromPersistanceStore() {
        do {
            let data = try Data(contentsOf: persistantStore())
            entries = try JSONDecoder().decode([Entry].self, from: data)
        } catch {
            print("we had a error loading our data from the persistance store.")
            print(error)
            print(error.localizedDescription)
        }
    }

}
