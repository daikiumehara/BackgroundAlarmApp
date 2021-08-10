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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SoundCell.self)
        tableView.dataSource = dataSource
    }

    func configure(dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
}

extension AddAlarmDetailViewController: UITableViewDelegate {

}

extension AddAlarmDetailViewController {
    static func instantiate() -> AddAlarmDetailViewController {
        guard let initialVC = UIStoryboard(name: "AddAlarmDetail", bundle: nil)
                .instantiateInitialViewController() as? AddAlarmDetailViewController else {
            fatalError("storyboardが見つかりません")
        }
        return initialVC
    }
}
