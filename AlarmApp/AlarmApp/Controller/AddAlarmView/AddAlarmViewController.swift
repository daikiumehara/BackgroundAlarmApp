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
//    private let alarmData = AlarmData()

    private let dataSource: UITableViewDataSource!
    //    let delegate: UITableViewDelegate?

    private let colorModel = ModelLocator.colorModel
    private var alarmData: AlarmData!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNVBarColor()
    }

    override func viewDidAppear(_ animated: Bool) {
        configureNVBarColor()
    }

    func configureNVBarColor() {
        self.navigationBar.barTintColor = colorModel.mainColor
    }
}
//
//class AddViewDelegate: NSObject, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        44
//    }
//}
