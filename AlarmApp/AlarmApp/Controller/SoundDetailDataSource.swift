//
//  SoundDetailDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/06.
//

import UIKit

class SoundDetailDataSource: NSObject, UITableViewDataSource {
    private var soundModel = ModelLocator.soundModel

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        soundModel.datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                withCellType: SoundCell.self,for: indexPath)
        return cell
    }

}
