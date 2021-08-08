//
//  AddAlarmCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/31.
//

import UIKit

class AddAlarmDetailCell: AddAlarmCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var itemLabel: UILabel!

    override func configure(title: String, item: String) {
        titleLabel.text = title
        itemLabel.text = item
    }

    func didTap() {

    }
}
