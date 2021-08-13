//
//  RepeatRowInfo.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/12.
//

import Foundation

enum RepeatRowInfo: Int, CaseIterable {
    case sunday, manday, tuesday, wednesday, thursday, friday, saturday

    var title: String {
        switch self {
        case .sunday: return "毎日曜日"
        case .manday: return "毎月曜日"
        case .tuesday: return "毎火曜日"
        case .wednesday: return "毎水曜日"
        case .thursday: return "毎木曜日"
        case .friday: return "毎金曜日"
        case .saturday: return "毎土曜日"
        }
    }
}
