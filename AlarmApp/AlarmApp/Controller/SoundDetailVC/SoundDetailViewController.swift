//
//  SoundDetailViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit

class SoundDetailViewController: AddAlarmDetailViewController {
    @IBOutlet private var tableView: UITableView!

    private var dataSource: SoundDetailDataSource!
    private var colorModel = ModelLocator.colorModel
    private(set) var selected: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        configureTableView()
        configureColor()
    }

    private func configureColor() {
        self.tableView.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
        self.view.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
    }

    private func configureTableView() {
        tableView.register(SoundCell.self)
        tableView.delegate = self
        tableView.dataSource = dataSource
    }

    override func setDelegate(_ dataSource: AddAlarmViewDataSource,
                              data: AlarmData) {
        self.delegate = dataSource
        self.selected = ModelLocator.soundModel.datas.firstIndex(of: data.soundData)!
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

// MARK: - UITableViewDelegate
extension SoundDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = indexPath.row
        tableView.reloadData()
    }
}

extension SoundDetailViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        self.delegate?.chengeSoundData(ModelLocator.soundModel.datas[selected])
    }
}
