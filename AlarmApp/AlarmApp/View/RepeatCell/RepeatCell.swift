//
//  RepeatCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/13.
//

import UIKit

class RepeatCell: UITableViewCell {
    @IBOutlet private var checkmark: UIImageView!
    @IBOutlet private var titleLabel: UILabel!

    private let colorModel = ModelLocator.colorModel

    func configure(_ title: String) {
        titleLabel.text = title
        configureColor()
    }
    private func configureColor() {
        self.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
        self.checkmark.tintColor =
            colorModel.mainColor
        self.titleLabel.textColor =
            colorModel.themeColor.textColor
        self.selectedBackgroundView = CellSelectedBackgroundView()
    }

    func showCheckmark() {
        checkmark.isHidden = false
    }

    func hiddenCheckmark() {
        checkmark.isHidden = true
    }
}
