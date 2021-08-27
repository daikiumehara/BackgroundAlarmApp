//
//  SettingViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import Combine
import ESTabBarController_swift

class SettingViewController: UIViewController {
    @IBOutlet private var navigationBar: UINavigationItem!
    @IBOutlet private var tableView: UITableView!

    private var colorModel = ModelLocator.colorModel
    private var dataSource: SettingViewDataSource!
    private var cancellable: Cancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureColor()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    private func configureColor() {
        configureNVBarColor()
    }

    private func configureTableView() {
        self.tableView.register(ThemeColorSettingCell.self)
        self.tableView.register(SettingCell.self)
        self.dataSource = SettingViewDataSource(self)
        self.tableView.dataSource = self.dataSource
    }

    private func configureNVBarColor() {
        self.navigationController?.navigationBar.tintColor =
            colorModel.themeColor.backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes =
            [.foregroundColor: colorModel.themeColor.backgroundColor]
        self.navigationController?.navigationBar.barTintColor =
            colorModel.mainColor
    }

    private func configureTabItem() {
        let contentView = BouncesContentView()
        contentView.configure(self.colorModel)
        self.tabBarItem = ESTabBarItem(contentView,
                                     title: "設定",
                                     image: UIImage(systemName: "gearshape"),
                                     selectedImage: UIImage(systemName: "gearshape"),
                                     tag: 3)
    }

    private func configureBinding() {
        self.cancellable = colorModel.$mainColor
            .sink(receiveValue: { [weak self] _ in
                print("setting View")
                self?.configureColor()
                self?.configureTabItem()
            })
    }
}

// MARK: - instantiate
extension SettingViewController {
    static func instantiate() -> SettingViewController {
        guard let initialVC = UIStoryboard(name: "Setting", bundle: nil)
                .instantiateInitialViewController() as? SettingViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.configureTabItem()
//        initialVC.setObserver()
        initialVC.configureBinding()
        return initialVC
    }
}

// MARK: - UITableViewDelegate
extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
