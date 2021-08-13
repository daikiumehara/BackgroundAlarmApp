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
        datas.remove(at: index)
    }
}
