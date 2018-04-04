//
//  Group.swift
//  MeetUpArchitecture
//
//  Created by 123 on 11.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation

struct Group {
    let createdAt: Double!
    let photoUrl: URL!
    let city: String!
    let country: String!
    let organizer: Organizer!
    
    var timeInterval: String {
        let date = Date(timeIntervalSince1970: createdAt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
    }
}
