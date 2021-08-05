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

//    let dataSource: UITableViewDataSource?
//    let delegate: UITableViewDelegate?

    let colorModel = ModelLocator.colorModel
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
//class AddViewDataSource: NSObject, UITableViewDataSource {
//    enum RowInfo: Int, CaseIterable {
//        case alarmRepeat, title, sound, snooze
//
//        var labelText: String {
//            switch self {
//            case .alarmRepeat: return "繰り返し"
//            case .title: return "タイトル"
//            case .sound: return "サウンド"
//            case .snooze: return "スヌーズ"
//            }
//        }
//
//        var cellIdentifier: String {
//            switch self {
//            case .alarmRepeat: return AddAlarmDetailCell.identifier
//            case .title: return "cell"
//            case .sound: return AddAlarmDetailCell.identifier
//            case .snooze: return "cell"
//        }
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        RowInfo.allCases.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let rowInfo = RowInfo(rawValue: indexPath.row)!
//        let cell = tableView.dequeueReusableCell(
//            withIdentifier: rowInfo.cellIdentifier ,for: indexPath)
//
//    }
//
//
//}
//
//class AddViewDelegate: NSObject, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        44
//    }
//}
