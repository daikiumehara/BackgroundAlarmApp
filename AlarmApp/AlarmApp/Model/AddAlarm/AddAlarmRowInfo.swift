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

    func getRowItem(_ data: AlarmData) -> String {
        switch self {
        case .alarmRepeat: return ""
        case .sound: return data.soundData.soundName
        case .snooze: return data.snooze.toString
        }
    }

    func didTapAction(_ viewController: UIViewController, _ dataSource: AddAlarmViewDataSource) -> (() -> Void) {
        switch self {
        case .alarmRepeat:
            return { [weak viewController, dataSource] in
                let nextVC = RepeatDetailViewController.instantiate()
                nextVC.configure(dataSource)
                viewController?.navigationController?.pushViewController(nextVC, animated: true)
            }
        case .sound:
            return { [weak viewController, dataSource] in
                let nextVC = SoundDetailViewController.instantiate()
                nextVC.configure(dataSource)
                viewController?.navigationController?.pushViewController(nextVC, animated: true)
            }
        case .snooze: return {}
        }
    }
}
