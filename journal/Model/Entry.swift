//
//  Entry.swift
//  journal
//
//  Created by Tanner Perry on 11/16/21.
//

import Foundation

class Entry: Codable {
    let title: String
    let body: String
    let timeStamp: Date
    
    init(title: String, body: String, timeStamp: Date){
        self.title = title
        self.body = body
        self.timeStamp = timeStamp
    }
}

extension Entry: Equatable {
    static func == (lhs:Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body && lhs.timeStamp == rhs.timeStamp
    }
    
}
