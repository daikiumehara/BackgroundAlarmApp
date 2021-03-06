//
//  AddAlarmDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/07.
//

import UIKit

class AddAlarmViewDataSource: NSObject, UITableViewDataSource {
    private weak var viewController: AddAlarmViewController!
    private var alarmData: AlarmData!

    init(_ viewController: AddAlarmViewController, _ data: AlarmData) {
        self.alarmData = data
        self.viewController = viewController
    }

    func updateAlarmData(_ data: AlarmData) {
        self.alarmData = data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AddAlarmRowInfo.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rowInfo = AddAlarmRowInfo(rawValue: indexPath.row) else {
            fatalError("列が見つかりませんでした")
        }
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: rowInfo.cellIdentifier, for: indexPath) as? AddAlarmCell else {
            fatalError("予想外のセルが返されました")
        }
        cell.configure(title: rowInfo.labelText,
                       item: rowInfo.getRowItem(alarmData),
                       didTap: rowInfo.didTapAction(viewController, self))
        return cell
    }

    func getAlarmData() -> AlarmData {
        return self.alarmData
    }
}

// MARK: - SoundDetailDelegate
extension AddAlarmViewDataSource: SoundDetailDelegate {
    func chengeSoundData(_ data: SoundData) {
        self.alarmData.soundData = data
    }
}

// MARK: - RepeatDetailDelegate
extension AddAlarmViewDataSource: RepeatDetailDelegate {
    func chengeRepeatDate(_ data: [Bool]) {
        self.alarmData.alarmRepeat = data
    }
}

// MARK: - SnoozeDelegate
extension AddAlarmViewDataSource: SnoozeDelegate {
    func chengeSnooze(_ data: Bool) {
        self.alarmData.snooze = data
    }
}
