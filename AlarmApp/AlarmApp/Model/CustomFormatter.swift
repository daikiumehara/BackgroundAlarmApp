//
//  Formatter.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/25.
//

import Foundation

struct CustomFormatter {

    static func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy:MM:dd:HH:mm:ss"
        return formatter.string(from: date)
    }    
}
