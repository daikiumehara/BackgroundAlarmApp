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

    private var dataSource: UITableViewDataSource!
    private var alarmModel = ModelLocator.alarmModel
    private let colorModel = ModelLocator.colorModel
    private var newAlarmData = AlarmData.newData()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNVBarColor()
        configureTableView()
        configureColor()
        configureNVBarColor()
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
        self.dataSource = AddAlarmViewDataSource(self.newAlarmData)
        self.tableView.dataSource = self.dataSource
        self.tableView.delegate = self
    }

    private func configureColor() {
        self.tableView.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
        self.view.backgroundColor =
            colorModel.themeColor.backgroundColor
    }

    @IBAction func didTapAddButton(_ sender: Any) {
        alarmModel.addData(self.newAlarmData)
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate
extension AddAlarmViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowInfo = AddAlarmRowInfo(rawValue: indexPath.row)!
        guard let nextVC = rowInfo.detailVC else {
            return
        }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
