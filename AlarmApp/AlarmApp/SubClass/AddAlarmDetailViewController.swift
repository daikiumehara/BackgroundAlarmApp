//
//  AddAlarmDetailViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/15.
//

import UIKit

class AddAlarmDetailViewController: UIViewController,
                                    AddAlarmAcceptanceProtocol {
    weak var delegate: AddAlarmViewDataSource?

    func setDelegate(_ dataSource: AddAlarmViewDataSource, data: AlarmData) {
    }
}
