//
//  AlarmViewDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

class AlarmViewDataSource: NSObject, UICollectionViewDataSource {
    private var colorModel: ColorModel

    init(_ colorModel: ColorModel) {
        self.colorModel = colorModel
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        SoundModel.datas.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: AlarmCell.identifier, for: indexPath) as? AlarmCell else {
            fatalError("セルが見つかりません")
        }
        let soundData = SoundModel.datas[indexPath.item]
        var data = AlarmData(title: "目覚まし",
                             time: Time(hour: 14, minute: 43),
                             soundData: soundData,
                             identifier: "2020:11:24:22:21:11",
                             setting: false)
        let changeSwitchValue = { setting in
            data.isSetting = setting
        }
        cell.configure(data: data, colorModel: colorModel, changeSwitchValue: changeSwitchValue)
        return cell
    }
}
