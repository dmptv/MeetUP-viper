//
//  NSAttributedString+Additions.swift
//  MeetUpArchitecture
//
//  Created by 123 on 12.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

extension String {
    
    func attributedString(fontSize: CGFloat, color: UIColor) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        
        let attributes = [NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)]
        attributedString.addAttributes(attributes, range: NSMakeRange(0, self.count))
        
        return attributedString
    }
}
