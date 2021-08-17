//
//  SettingViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class SettingViewController: UIViewController {
    @IBOutlet private var navigationBar: UINavigationItem!
    @IBOutlet private var tableView: UITableView!
    
    private lazy var colorModel = ModelLocator.colorModel {
        didSet {
            colorModel.addVC(self)
        }
    }
    private var dataSource: SettingViewDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        configureColor()
    }

    private func configureColor() {
        self.tableView.dataSource = self.dataSource
        configureNVBarColor()
    }

    private func configureTableView() {
        self.tableView.register(ThemeColorSettingCell.self)
        self.tableView.register(SettingCell.self)
        self.dataSource = SettingViewDataSource(self)
    }

    private func configureNVBarColor() {
        self.navigationController?.navigationBar.tintColor =
            colorModel.themeColor.backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes =
            [.foregroundColor: colorModel.themeColor.backgroundColor]
        self.navigationController?.navigationBar.barTintColor =
            colorModel.mainColor
    }
}

// MARK: - instantiate
extension SettingViewController {
    static func instantiate() -> SettingViewController {
        guard let initialVC = UIStoryboard(name: "Setting", bundle: nil)
                .instantiateInitialViewController() as? SettingViewController else {
            fatalError("storyboardが見つかりません")
        }
        let contentView = BouncesContentView()
        contentView.configure(initialVC.colorModel)
        initialVC.tabBarItem = ESTabBarItem(contentView,
                                     title: "設定",
                                     image: UIImage(systemName: "gearshape"),
                                     selectedImage: UIImage(systemName: "gearshape"),
                                     tag: 3)
        return initialVC
    }
}
