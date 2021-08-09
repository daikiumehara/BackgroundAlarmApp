//
//  AddAlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/29.
//

import UIKit

class AddAlarmViewController: UIViewController {
    @IBOutlet private var topSafeAreaView: UIView!
    @IBOutlet private var navigationBar: UINavigationBar!
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var timeSettingView: TimeSettingView!

    private var dataSource: UITableViewDataSource!
    private var delegate: UITableViewDelegate!

    private let colorModel = ModelLocator.colorModel
    private var alarmData = AlarmData.newData()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNVBarColor()
        configureTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        configureNVBarColor()
    }

    private func configureNVBarColor() {
        self.navigationBar.barTintColor = colorModel.mainColor
    }

    private func configureTableView() {
        self.tableView.register(AddAlarmDetailCell.self)
        self.tableView.register(AddAlarmSnoozeCell.self)
        self.dataSource = AddAlarmViewDataSource(self.alarmData)
        self.delegate = AddAlarmViewDelegate()
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self.delegate
    }
}