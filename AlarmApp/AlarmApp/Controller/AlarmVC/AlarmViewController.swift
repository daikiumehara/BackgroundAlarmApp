//
//  AlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import Combine
import ESTabBarController_swift

class AlarmViewController: UIViewController {
    @IBOutlet private var alarmView: UICollectionView!
    @IBOutlet private var topSafeAreaView: UIView!
    @IBOutlet private var navigationBar: UINavigationBar!

    private var colorModel = ModelLocator.colorModel
    private var cancellable: Cancellable?
    private let alarmViewDataSource = AlarmViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        askPermissionNontification()
        configureCollectionView()
        configureColor()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.alarmView.reloadData()
    }

    private func askPermissionNontification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
            if let error = error {
                print(error)
            }
        }
    }

    private func configureColor() {
        configureNVBarColor()
        alarmView.backgroundColor = colorModel.themeColor.backgroundColor
    }

    private func configureNVBarColor() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = colorModel.mainColor
        self.topSafeAreaView.backgroundColor = colorModel.mainColor
    }

    private func configureCollectionView() {
        alarmView.register(AlarmCell.self)
        alarmView.dataSource = alarmViewDataSource
        alarmView.collectionViewLayout = AlarmViewLayout()
    }

    private func configureTabItem() {
        let contentView = BouncesContentView()
        contentView.configure(self.colorModel)
        self.tabBarItem = ESTabBarItem(contentView,
                                     title: "アラーム",
                                     image: UIImage(systemName: "alarm"),
                                     selectedImage: UIImage(systemName: "alarm"),
                                     tag: 1)
    }

    private func configureBinding() {
        self.cancellable = colorModel.$mainColor
            .sink(receiveValue: { [weak self] _ in
                    print("alarmView")
//                    self?.configureColor()
                    self?.configureTabItem()
//                    self?.alarmView.reloadData()
            })
    }
}

// MARK: - instantiate
extension AlarmViewController {
    static func instantiate() -> AlarmViewController {
        guard let initialVC = UIStoryboard(name: "Alarm", bundle: nil)
                .instantiateInitialViewController()as? AlarmViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.configureTabItem()
        initialVC.configureBinding()
        return initialVC
    }
}
