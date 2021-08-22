//
//  AddAlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/29.
//

import UIKit

class AddAlarmViewController: UIViewController {
    @IBOutlet private var topSafeAreaView: UIView!
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var timeSettingView: TimeSettingView!
    @IBOutlet private var barAddButton: UIBarButtonItem!
    @IBOutlet private var barBackButton: UIBarButtonItem!
    @IBOutlet private var titleSettingView: TitleSettingView!

    private var dataSource: AddAlarmViewDataSource!
    private var alarmModel = ModelLocator.alarmModel
    private let colorModel = ModelLocator.colorModel
    private var alarmData = AlarmData.newData()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNVBarColor()
        configureTableView()
        configureColor()
        configureNVBarColor()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    private func configureNVBarColor() {
        self.navigationController?.navigationBar.tintColor =
            colorModel.themeColor.backgroundColor
        self.navigationController?.navigationBar.titleTextAttributes =
            [.foregroundColor: colorModel.themeColor.backgroundColor]
        self.navigationController?.navigationBar.barTintColor =
            colorModel.mainColor
    }

    private func configureTableView() {
        self.tableView.register(AddAlarmDetailCell.self)
        self.tableView.register(AddAlarmSnoozeCell.self)
        self.dataSource = AddAlarmViewDataSource(self, self.alarmData)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
    }

    private func configureColor() {
        self.tableView.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
        self.view.backgroundColor =
            colorModel.themeColor.backgroundColor
    }

    @IBAction private func didTapAddButton(_ sender: Any) {
        addNewData()
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func didTapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    private func addNewData() {
        var newData = dataSource.getAlarmData()
        newData.title = titleSettingView.getTitle()
        newData.time = timeSettingView.getTime()
        alarmModel.addData(newData)
    }
}

// MARK: - UITableViewDelegate
extension AddAlarmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}
