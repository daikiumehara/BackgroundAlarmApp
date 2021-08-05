//
//  AlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class AlarmViewController: UIViewController {
    @IBOutlet private var alarmView: UICollectionView!
    @IBOutlet private var topSafeAreaView: UIView!
    @IBOutlet private var navigationBar: UINavigationBar!

    private var colorModel = ModelLocator.colorModel
    private let alarmViewDelegate = AlarmViewDelegate()
    private let alarmViewDataSource = AlarmViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        askPermissionNontification()
        configureCollectionView()
    }

    override func viewDidAppear(_ animated: Bool) {
        configureNVBarColor()
    }

    func askPermissionNontification() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, error in
            if let error = error {
                print(error)
            }
        }
    }

    func configureNVBarColor() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = colorModel.mainColor
        self.topSafeAreaView.backgroundColor = colorModel.mainColor
    }

    func configureCollectionView() {
        alarmView.register(AlarmCell.self)
        alarmView.delegate = alarmViewDelegate
        alarmView.dataSource = alarmViewDataSource
        alarmView.collectionViewLayout = AlarmViewLayout()
        alarmView.backgroundColor = colorModel.themeColor.backgroundColor
    }
}

// MARK: - instantiate
extension AlarmViewController {
    static func instantiate() -> AlarmViewController {
        guard let initialVC = UIStoryboard(name: "Alarm", bundle: nil)
                .instantiateInitialViewController()as? AlarmViewController else {
            fatalError("storyboardが見つかりません")
        }
        let contentView = BouncesContentView()
        contentView.configure(initialVC.colorModel)
        initialVC.tabBarItem = ESTabBarItem(contentView,
                                     title: "アラーム",
                                     image: UIImage(systemName: "alarm"),
                                     selectedImage: UIImage(systemName: "alarm"),
                                     tag: 1)
        return initialVC
    }
}
