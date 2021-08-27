//
//  NotificationManager.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/27.
//

import UIKit

struct NotificationManager {
    static func addAlarm(_ data: AlarmData) {
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
        let sound = UNNotificationSound(named: UNNotificationSoundName(data.soundData.fileName))
        content.sound = sound
        var component = DateComponents()
        component.hour = data.time.hour
        component.minute = data.time.minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: true)
        let request = UNNotificationRequest(identifier: data.alarmIdentifier,
                                            content: content,
                                            trigger: trigger)
        center.add(request) { error in
            if let error = error {
                print("エラーが発生しました\(error)")
            }
        }
        print("アラームがセットされました")
    }

    static func removeAlarm(_ data: AlarmData) {
        let center = UNUserNotificationCenter.current()
        print("アラームが解除されました")
        center.removePendingNotificationRequests(withIdentifiers: [data.alarmIdentifier])
    }
}
