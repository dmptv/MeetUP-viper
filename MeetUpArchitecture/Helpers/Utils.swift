//
//  Utils.swift
//  MeetUpArchitecture
//
//  Created by 123 on 11.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation

internal func printMine( _ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        var i = items.startIndex
        repeat {
            Swift.print(items[i], separator: separator, terminator: i == (items.endIndex - 1) ? terminator : separator)
            i += 1
        } while i < items.endIndex
    #endif
}

 typealias VoidCompletion = () -> ()


