//
//  ThemeColorSettingCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/16.
//

import UIKit

class ThemeColorSettingCell: SelectedCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var mainColorView: UIView!

    private var colorModel = ModelLocator.colorModel
    override func configure(_ title: String, _ didTapAction: @escaping () -> Void) {
        self.titleLabel.text = title
        self.didTapAction = didTapAction
        configureColor()
    }

    private func configureColor() {
        self.titleLabel.textColor = colorModel.themeColor.textColor
        self.mainColorView.backgroundColor = colorModel.mainColor
        self.backgroundColor = colorModel.themeColor.cellBackgroundColor
        self.mainColorView.layer.cornerRadius = 5.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.didTapAction()
            self.isSelected = false
        }
    }
}
