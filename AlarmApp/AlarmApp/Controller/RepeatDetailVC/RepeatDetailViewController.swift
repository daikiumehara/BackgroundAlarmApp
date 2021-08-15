//
//  RepeatDetailViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/13.
//

import UIKit

class RepeatDetailViewController: AddAlarmDetailViewController {
    @IBOutlet private var tableView: UITableView!
    private(set) var repeatDatas: [Bool]!

    private var dataSource: RepeatDetailDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(RepeatCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource
        navigationController?.delegate = self
    }

    override func setDelegate(_ dataSource: AddAlarmViewDataSource,
                              data: AlarmData) {
        self.delegate = dataSource
        self.repeatDatas = data.alarmRepeat
    }
}

// MARK: - instantiate
extension RepeatDetailViewController {
    static func instantiate() -> RepeatDetailViewController {
        guard let initialVC = UIStoryboard(name: "RepeatDetail", bundle: nil)
                .instantiateInitialViewController() as? RepeatDetailViewController else {
            fatalError("StoryBoardが見つかりませんでした")
        }
        initialVC.repeatDatas = [Bool](repeating: false,
                                       count: RepeatRowInfo.allCases.count)
        initialVC.dataSource = RepeatDetailDataSource(initialVC)
        return initialVC
    }
}

// MARK: - UITableViewDelegate
extension RepeatDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.repeatDatas[indexPath.row] = !self.repeatDatas[indexPath.row]
        tableView.reloadData()
    }
}

extension RepeatDetailViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        self.delegate?.chengeRepeatDate(self.repeatDatas)
    }
}
