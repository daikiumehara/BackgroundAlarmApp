//
//  AlarmData.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

struct AlarmData: Comparable {
    var title: String
    var time: Time
    var soundData: SoundData
    var alarmIdentifier: String  // 作成した年日時秒(アラームの識別に使用)
    var isSetting: Bool {
        didSet {
            settingAlarm()
        }
    }

    init(title: String, time: Time, soundData: SoundData,
         identifier: String, setting: Bool) {
        self.title = title
        self.time = time
        self.soundData = soundData
        self.alarmIdentifier = identifier
        self.isSetting = setting
        if setting {
            settingAlarm()
        }
    }

    static func == (lhs: AlarmData, rhs: AlarmData) -> Bool {
        return lhs.alarmIdentifier == rhs.alarmIdentifier
    }

    static func < (lhs: AlarmData, rhs: AlarmData) -> Bool {
        return  lhs.time.toDate() > rhs.time.toDate()
    }

    private func settingAlarm() {
        let center = UNUserNotificationCenter.current()
        // アラームの解除
        guard isSetting else {
            print("アラームが解除されました")
            center.removePendingNotificationRequests(withIdentifiers: [alarmIdentifier])
            return
        }
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
}
