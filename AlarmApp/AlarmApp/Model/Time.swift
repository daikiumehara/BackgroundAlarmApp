//
//  Time.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/28.
//

import Foundation

struct Time {
    var hour: Int
    var minute: Int

    func getTimeString() -> String {
        return "\(hour):\(minute)"
    }
}
