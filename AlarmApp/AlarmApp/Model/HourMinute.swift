//
//  Time.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/28.
//

import Foundation

struct HourMinute {
    var hour: Int
    var minute: Int

    func toString() -> String {
        return "\(hour):\(String(format: "%02d", minute))"
    }

    func toDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        guard let date = formatter.date(from: self.toString()) else {
            fatalError("formatterに不正な文字列が渡されました")
        }
        return date
    }
}
