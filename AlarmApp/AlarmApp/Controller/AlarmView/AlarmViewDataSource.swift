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

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ModelLocator.soundModel.datas.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withCellType: AlarmCell.self, indexPath: indexPath)
        let soundData = soundModel.datas[indexPath.item]
        var data = AlarmData(title: "目覚まし",
                             time: Time(hour: 14, minute: 43),
                             soundData: soundData,
                             identifier: "2020:11:24:22:21:11",
                             snooze: false,
                             alarmRepeat: false,
                             setting: false)
        let changeSwitchValue = { setting in
            data.isSetting = setting
        }
        cell.configure(data: data, colorModel: colorModel, changeSwitchValue: changeSwitchValue)
        return cell
    }
}
