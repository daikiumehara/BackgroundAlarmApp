//
//  AlarmData.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//
import UIKit

struct AlarmData: Comparable {
    var title: String
    var time: HourMinute
    var soundData: SoundData
    var alarmIdentifier = UUID().uuidString
    var snooze: Bool
    var alarmRepeat: [Bool]
    var isOn: Bool

    static func == (lhs: AlarmData, rhs: AlarmData) -> Bool {
        return lhs.time.toDate() > rhs.time.toDate()
    }

    static func < (lhs: AlarmData, rhs: AlarmData) -> Bool {
        return lhs.time.toDate() > rhs.time.toDate()
    }
}

// MARK: - newData
extension AlarmData {
    static func newData() -> AlarmData {
        let repeatDatas = [Bool](repeating: false, count: RepeatRowInfo.allCases.count)
        return AlarmData(title: "タイトル", time: HourMinute(hour: 12, minute: 0),
                         soundData: SoundData(soundName: "ベルの音", fileName: "clock_bell.mp3"),
                         snooze: false, alarmRepeat: repeatDatas, isOn: false)
    }
}
