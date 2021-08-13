//
//  AlarmViewDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

class AlarmViewDataSource: NSObject, UICollectionViewDataSource {
    private var colorModel = ModelLocator.colorModel
    private var soundModel = ModelLocator.soundModel
    private var alarmModel = ModelLocator.alarmModel

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        alarmModel.datas.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: AlarmCell.self, indexPath: indexPath)
        var data = alarmModel.datas[indexPath.item]
        let changeSwitchValue = { setting in
            data.isSetting = setting
        }
        cell.configure(data: data, colorModel: colorModel, changeSwitchValue: changeSwitchValue)
        return cell
    }
}
