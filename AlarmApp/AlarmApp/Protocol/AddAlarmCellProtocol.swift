//
//  AddAlarmCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/09.
//

import UIKit

protocol AddAlarmCellProtocol: NSObject {
    func configure(title: String, item: String, didTap: @escaping () -> Void)
}
