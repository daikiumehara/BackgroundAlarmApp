//
//  SoundDetailDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/06.
//

import UIKit

protocol TableViewSelectedProtocol: NSObject {
    var selected: Int { get set }
}

class SoundDetailDataSource: NSObject, UITableViewDataSource,
                             TableViewSelectedProtocol {
    private var soundModel = ModelLocator.soundModel
    var selected: Int = 0

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        soundModel.datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                withCellType: SoundCell.self, for: indexPath)
        cell.configure(soundModel.datas[indexPath.row]) { fileName in
            ModelLocator.player.playSound(fileName)
        }
        if selected == indexPath.row {
            cell.showCheckmark()
        } else {
            cell.hiddenCheckmark()
        }
        return cell
    }
}
