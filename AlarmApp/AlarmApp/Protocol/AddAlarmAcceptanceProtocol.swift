//
//  AddAlarm.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/15.
//

import Foundation

protocol AddAlarmAcceptanceProtocol: NSObject {
    var delegate: AddAlarmViewDataSource? { get set }
    func setDelegate(_ dataSource: AddAlarmViewDataSource, data: AlarmData)
}
