//
//  AddAlarmRowInfo.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/07.
//

import UIKit

enum AddAlarmRowInfo: Int, CaseIterable {
    case alarmRepeat, title, sound, snooze

    static let detailCellType = AddAlarmDetailCell.self
    static let snoozeCellType = AddAlarmDetailCell.self

    var labelText: String {
        switch self {
        case .alarmRepeat: return "繰り返し"
        case .title: return "タイトル"
        case .sound: return "サウンド"
        case .snooze: return "スヌーズ"
        }
    }

    var cellIdentifier: String {
        switch self {
        case .alarmRepeat:
            return AddAlarmDetailCell.identifier
        case .title:
            return AddAlarmDetailCell.identifier
        case .sound:
            return AddAlarmDetailCell.identifier
        case .snooze:
            return AddAlarmDetailCell.identifier
        }
    }

    var detailDataSource: UITableViewDataSource? {
        switch self {
        case .alarmRepeat: return SoundDetailDataSource()
        case .title: return SoundDetailDataSource()
        case .sound: return SoundDetailDataSource()
        case .snooze: return nil
        }
    }

    func getRowItem(_ data: AlarmData) -> String {
        switch self {
        case .alarmRepeat: return data.title
        case .title: return data.title
        case .sound: return data.soundData.soundName
        case .snooze: return data.snooze.toString
        }
    }
}
