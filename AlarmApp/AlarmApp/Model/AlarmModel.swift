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
        datas.append(data)
    }

    func removeData(_ data: AlarmData) {
        guard let index = datas.firstIndex(of: data) else {
            return
        }
        NotificationManager.removeAlarm(datas[index])
        datas.remove(at: index)
    }

    func changeValue(index: Int, data: AlarmData) {
        self.datas[index] = data
    }
}
