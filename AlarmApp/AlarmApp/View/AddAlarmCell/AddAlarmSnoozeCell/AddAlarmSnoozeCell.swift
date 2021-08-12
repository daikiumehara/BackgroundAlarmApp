//
//  AddAlarmSnoozeCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit

class AddAlarmSnoozeCell: AddAlarmCell {
    private var colorModel = ModelLocator.colorModel
    @IBOutlet private var snoozeSwitch: UISwitch!
    @IBOutlet private var titleLabel: UILabel!

    private var item: Bool!

    override func configure(title: String, item: String) {
        self.titleLabel.text = title
        self.item = item.toBool
        self.snoozeSwitch.isOn = self.item
        configureColor()
    }

    func getCellItem() -> Bool {
        self.item
    }

    private func configureColor() {
        self.titleLabel.textColor = colorModel.themeColor.textColor
        self.snoozeSwitch.onTintColor = colorModel.mainColor
        self.backgroundColor = colorModel.themeColor.cellBackgroundColor
        self.selectedBackgroundView = CellSelectedBackgroundView()
    }

    @IBAction private func didChangeSwitchValue(_ sender: Any) {
        self.item = !self.item
        self.snoozeSwitch.isOn = self.item
    }
}
