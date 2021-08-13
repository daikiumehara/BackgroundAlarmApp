//
//  AddAlarmRowInfo.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/07.
//

import UIKit

enum AddAlarmRowInfo: Int, CaseIterable {
    case alarmRepeat, sound, snooze

    var labelText: String {
        switch self {
        case .alarmRepeat: return "繰り返し"
        case .sound: return "サウンド"
        case .snooze: return "スヌーズ"
        }
    }

    var cellIdentifier: String {
        switch self {
        case .alarmRepeat:
            return AddAlarmDetailCell.identifier
        case .sound:
            return AddAlarmDetailCell.identifier
        case .snooze:
            return AddAlarmSnoozeCell.identifier
        }
    }

    var detailVC: UIViewController? {
        switch self {
        case .alarmRepeat: return RepeatDetailViewController.instantiate()
        case .sound: return SoundDetailViewController.instantiate()
        case .snooze: return nil
        }
    }

    func getRowItem(_ data: AlarmData) -> String {
        switch self {
        case .alarmRepeat: return ""
        case .sound: return data.soundData.soundName
        case .snooze: return data.snooze.toString
        }
    }
}
