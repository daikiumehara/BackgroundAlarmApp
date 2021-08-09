//
//  AddAlarmDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/07.
//

import UIKit

class AddAlarmViewDataSource: NSObject, UITableViewDataSource {
    private var alarmData: AlarmData!

    init(_ data: AlarmData) {
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

        cell.configure(title: alarmData.title,
                       item: rowInfo.getRowItem(alarmData))
        return cell
    }
}
