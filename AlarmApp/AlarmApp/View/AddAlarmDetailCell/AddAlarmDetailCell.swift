//
//  AddAlarmCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/31.
//

import UIKit

class AddAlarmDetailCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var itemLabel: UILabel!

    func configure(title: String, item: String) {
        titleLabel.text = title
        itemLabel.text = item
    }
}
