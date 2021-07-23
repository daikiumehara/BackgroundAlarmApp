//
//  HomeTabViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class HomeTabViewController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let alarmVC = AlarmViewController()
        let timerVC = TimerViewController()
        let settingVC = SettingViewController()
        self.viewControllers = [alarmVC, timerVC, settingVC]
    }
}
