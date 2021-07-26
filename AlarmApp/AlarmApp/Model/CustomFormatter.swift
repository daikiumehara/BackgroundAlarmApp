//
//  Formatter.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/25.
//

import Foundation

struct CustomFormatter {
    static func timeToStirng(_ time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:MM"
        return formatter.string(from: time)
    }

    static func stringToTime(_ string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:MM"
        guard let date = formatter.date(from: string) else {
            fatalError("formatterに不正な文字列が渡されました")
        }
        return date
    }

    static func dateToString(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy:MM:dd:HH:mm:ss"
        return formatter.string(from: date)
    }

    static func getHourValue(_ time: String) -> Int {
        let strings = time.split(separator: ":")
        guard let hour = Int(strings[0]) else {
            return 12
        }
        return hour
    }

    static func getMinuteValue(_ time: String) -> Int {
        let strings = time.split(separator: ":")
        guard let minute = Int(strings[1]) else {
            return 0
        }
        return minute
    }
}
