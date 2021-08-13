//
//  SoundDetailViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit

class SoundDetailViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    private var dataSource: SoundDetailDataSource!
    private var colorModel = ModelLocator.colorModel
    private(set) var selected: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SoundCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource
        colorConfigure()
    }

    private func colorConfigure() {
        self.tableView.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
        self.view.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
    }
}

// MARK: - instantiate
extension SoundDetailViewController {
    static func instantiate() -> SoundDetailViewController {
        guard let initialVC = UIStoryboard(name: "SoundDetail", bundle: nil)
                .instantiateInitialViewController() as? SoundDetailViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.dataSource = SoundDetailDataSource(initialVC)
        return initialVC
    }
}

extension SoundDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = indexPath.row
        tableView.reloadData()
    }
}
