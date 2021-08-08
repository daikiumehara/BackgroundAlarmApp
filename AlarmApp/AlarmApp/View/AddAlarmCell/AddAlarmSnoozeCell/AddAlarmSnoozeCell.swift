//
//  AddAlarmSnoozeCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit

class AddAlarmSnoozeCell: AddAlarmCell {
    @IBOutlet private var snoozeSwitch: UISwitch!
    @IBOutlet private var titleLabel: UILabel!

    private var item: Bool!

    override func configure(title: String, item: String) {
        self.titleLabel.text = title
        self.item = item.toBool
        self.snoozeSwitch.isOn = self.item
    }

    func getCellItem() -> Bool {
        self.item
    }

    @IBAction private func didChangeSwitchValue(_ sender: Any) {
        self.item = !self.item
        self.snoozeSwitch.isOn = self.item
    }
}
