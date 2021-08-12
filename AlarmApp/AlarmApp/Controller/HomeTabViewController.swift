//
//  HomeTabViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class HomeTabViewController: ESTabBarController {
    private var colorModel = ModelLocator.colorModel
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureVC()
        self.configureColor()
    }

    private func configureVC() {
        let alarmVC = AlarmViewController.instantiate()
        let timerVC = TimerViewController.instantiate()
        let settingVC = SettingViewController.instantiate()
        self.viewControllers = [alarmVC, timerVC, settingVC]
    }

    private func configureColor() {
        self.tabBar.barTintColor = colorModel.themeColor.tabBarColor
        self.tabBar.backgroundColor = colorModel.themeColor.tabBarColor
        self.tabBar.layer.borderWidth = 0.5
        self.tabBar.layer.borderColor = colorModel.themeColor.textColor.cgColor
    }
}
