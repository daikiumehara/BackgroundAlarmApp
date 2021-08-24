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
    private var colorModelObserver: ColorModelObserver!

    override func viewDidLoad() {
        super.viewDidLoad()
        setObserver()
        configureVC()
        configureColor()
        removeNotification()
    }

    private func removeNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        #warning("機能が完成したら削除する")
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

    private func setObserver() {
        self.colorModelObserver = ColorModelObserver(colorModel: colorModel,
                                                     changedHandler: { [weak self] in
            self?.configureColor()
        })
    }
}
