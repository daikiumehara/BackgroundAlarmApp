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
    private(set) var isOn: Bool {
        didSet {
            settingAlarm()
        }
    }

    init(title: String, time: HourMinute, soundData: SoundData,
         snooze: Bool, alarmRepeat: [Bool], isOn: Bool) {
        self.title = title
        self.time = time
        self.soundData = soundData
        self.snooze = snooze
        self.alarmRepeat = alarmRepeat
        self.isOn = isOn
        if isOn {
            addAlarm()
        }
    }

    static func == (lhs: AlarmData, rhs: AlarmData) -> Bool {
        return lhs.time.toDate() > rhs.time.toDate()
    }

    static func < (lhs: AlarmData, rhs: AlarmData) -> Bool {
        return lhs.time.toDate() > rhs.time.toDate()
    }

    mutating func setAlarm() {
        self.isOn = true
    }

    mutating func cancelAlarm() {
        self.isOn = false
    }

    private func settingAlarm() {
        if isOn {
            addAlarm()
        } else {
            removeAlarm()
        }
    }

    private func addAlarm() {
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { setting in
            guard setting.alertSetting == .enabled else {
                print("許可されていません")
                return
            }
        }
        let content = UNMutableNotificationContent()
        content.title = "アラーム"
        content.body = "起床の時間です"
        let sound = UNNotificationSound(named: UNNotificationSoundName(soundData.fileName))
        content.sound = sound
        var component = DateComponents()
        component.hour = time.hour
        component.minute = time.minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: true)
        let request = UNNotificationRequest(identifier: alarmIdentifier,
                                            content: content,
                                            trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("エラーが発生しました\(error)")
            }
        }
        print("アラームがセットされました")
    }

    private func removeAlarm() {
        let center = UNUserNotificationCenter.current()
        print("アラームが解除されました")
        center.removePendingNotificationRequests(withIdentifiers: [alarmIdentifier])
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
