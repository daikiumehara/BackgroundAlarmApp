//
//  AddAlarmDetailViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit

class AddAlarmDetailViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    private var dataSource: UITableViewDataSource!
    private var selected: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SoundCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource
    }

    func configure(dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
}

// MARK: - Delegate
extension AddAlarmDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dataSource = dataSource as? TableViewSelectedProtocol else {
            return
        }
        dataSource.selected = indexPath.row
        tableView.reloadData()
    }
}

// MARK: - instantiate
extension AddAlarmDetailViewController {
    static func instantiate() -> AddAlarmDetailViewController {
        guard let initialVC = UIStoryboard(name: "AddAlarmDetail", bundle: nil)
                .instantiateInitialViewController() as? AddAlarmDetailViewController else {
            fatalError("storyboardが見つかりません")
        }
        return initialVC
    }
}
