//
//  AddAlarmViewDelegate.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/09.
//

import UIKit

class AddAlarmViewDelegate: NSObject, UITableViewDelegate {
    private weak var viewController: UIViewController!

    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowInfo = AddAlarmRowInfo(rawValue: indexPath.row)!
        let nextVC = AddAlarmDetailViewController.instantiate()
        if let dataSource = rowInfo.detailDataSource {
            nextVC.configure(dataSource: dataSource)
            self.viewController?.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
