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

    static func dateToTime(_ date: Date) -> Time {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let timeStrings = formatter.string(from: date).split(separator: ":")
        guard let hour = Int(timeStrings[0]),
              let minute = Int(timeStrings[1]) else {
            fatalError("dateからTimeへの変換でエラーが発生しました")
        }
        return Time(hour: hour, minute: minute)
    }
}
