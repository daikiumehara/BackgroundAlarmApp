//
//  SettingViewDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/16.
//

import UIKit

class SettingViewDataSource: NSObject, UITableViewDataSource {
    private weak var viewController: SettingViewController!

    init(_ viewController: SettingViewController) {
        self.viewController = viewController
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingRowInfo.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowInfo = SettingRowInfo(rawValue: indexPath.row)!
        guard let cell = tableView.dequeueReusableCell(withIdentifier: rowInfo.cellIdentifier,
                                                       for: indexPath) as? SelectedCell else {
            fatalError("\(rowInfo.cellIdentifier) セルが見つかりませんでした")
        }
        cell.configure(rowInfo.title, rowInfo.didTapAction(viewController))
        return cell
    }
}
