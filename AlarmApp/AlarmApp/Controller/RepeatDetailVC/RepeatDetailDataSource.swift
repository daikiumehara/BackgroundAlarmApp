//
//  RepeatDetailDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/13.
//

import UIKit

class RepeatDetailDataSource: NSObject, UITableViewDataSource {
    private weak var viewController: RepeatDetailViewController!

    init(_ viewController: RepeatDetailViewController) {
        self.viewController = viewController
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RepeatRowInfo.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellType: RepeatCell.self,
            for: indexPath)
        let rowInfo = RepeatRowInfo(rawValue: indexPath.row)!
        if self.viewController.repeatDatas[indexPath.row] {
            cell.showCheckmark()
        } else {
            cell.hiddenCheckmark()
        }
        cell.configure(rowInfo.title)
        return cell
    }
}
