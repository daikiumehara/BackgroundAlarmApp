//
//  SettingCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/16.
//

import UIKit

class SettingCell: SelectedCell {
    @IBOutlet private var titleLabel: UILabel!

    private var colorModel = ModelLocator.colorModel

    override func configure(_ title: String, _ didTapAction: @escaping () -> Void) {
        self.titleLabel.text = title
        self.didTapAction = didTapAction
        configureColor()
    }

    private func configureColor() {
        self.titleLabel.textColor = colorModel.themeColor.textColor
        self.backgroundColor = colorModel.themeColor.cellBackgroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.didTapAction()
            self.isSelected = false
        }
    }
}
