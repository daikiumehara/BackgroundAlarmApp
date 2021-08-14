//
//  AddAlarmDelegate.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/14.

import UIKit

class AddAlarmAcceptanceController: UIViewController {
    weak var delegate: AddAlarmViewController?

    func setDelegate(_ viewController: AddAlarmViewController, data: AlarmData) {}
}

protocol SoundDetailDelegate: NSObject {
    func chengeSoundData(_ data: SoundData)
}

protocol RepeatDetailDelegate: NSObject {
    func chengeRepeatDate(_ data: [Bool])
}
