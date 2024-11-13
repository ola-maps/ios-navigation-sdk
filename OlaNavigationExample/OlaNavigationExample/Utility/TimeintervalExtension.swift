//
//  Timeinterval+Extension.swift
//  OlaNavigationExample
//
//  Created by Abhishek Ravi on 12/08/24.
//

import Foundation

extension TimeInterval {
    
    func getDistanceStr() -> String {
        let totalMinutes = Int(self / 60)
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        
        var timeString = ""
        if hours > 0 {
            timeString += "\(hours) h"
            if hours > 1 {
                timeString += "s"
            }
        }
        
        if minutes > 0 {
            if !timeString.isEmpty {
                timeString += " "
            }
            timeString += "\(minutes) m"
            if minutes > 1 {
                timeString += "s"
            }
        }
        
        return timeString
    }
}
