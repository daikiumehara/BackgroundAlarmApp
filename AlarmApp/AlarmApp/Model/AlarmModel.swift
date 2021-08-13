//
//  AlarmModel.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/26.
//

import Foundation

class AlarmModel {
    private(set) var datas: [AlarmData] = []

    func addData(_ data: AlarmData) {
        var newData = data
        newData.setAlarm()
        datas.append(newData)
    }

    func removeData(_ data: AlarmData) {
        guard let index = datas.firstIndex(of: data) else {
            return
        }
        datas[index].cancelAlarm()
        datas.remove(at: index)
    }
}
