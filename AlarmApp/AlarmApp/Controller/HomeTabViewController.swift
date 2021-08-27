//
//  HomeTabViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import Combine
import ESTabBarController_swift

class HomeTabViewController: ESTabBarController {
    private var colorModel = ModelLocator.colorModel
    private var cancellable: Cancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureBinding()
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

    private func configureBinding() {
        self.cancellable = colorModel.$mainColor
            .sink(receiveValue: { [weak self] _ in
                self?.configureColor()
            })
    }
}
