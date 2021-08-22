//
//  SoundDetailDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/06.
//

import UIKit

class SoundDetailDataSource: NSObject, UITableViewDataSource {
    private weak var viewController: SoundDetailViewController!
    private var soundModel = ModelLocator.soundModel

    init(_ viewController: SoundDetailViewController) {
        self.viewController = viewController
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        soundModel.datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                withCellType: SoundCell.self, for: indexPath)
        cell.configure(soundModel.datas[indexPath.row]) { fileName in
            ModelLocator.player.playSound(fileName)
        }
        if self.viewController.selected == indexPath.row {
            cell.showCheckmark()
        } else {
            cell.hiddenCheckmark()
        }
        return cell
    }
}
