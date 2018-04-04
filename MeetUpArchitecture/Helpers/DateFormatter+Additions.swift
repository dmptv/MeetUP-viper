//
//  DateFormatter+Additions.swift
//  MeetUpArchitecture
//
//  Created by 123 on 12.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    class func dateWithNoTimeFromTimeInterval(_ timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
    }
}
