//
//  AlarmDataIdentifierEquatable.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/23.
//

import Foundation

struct AlarmDataIdentifierEquatableBox {
    static func delete(datas: [AlarmData], deleteData: AlarmData) -> [AlarmData] {
        datas.filter { $0.alarmIdentifier != deleteData.alarmIdentifier }
    }
}
