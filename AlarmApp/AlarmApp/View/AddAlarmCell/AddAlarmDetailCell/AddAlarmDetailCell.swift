//
//  AddAlarmDetailCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/09.
//
import UIKit

class AddAlarmDetailCell: AddAlarmCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var itemLabel: UILabel!

    private var colorModel = ModelLocator.colorModel
//    private var dataSource: UITableViewDataSource!
    private var didTapAction: (() -> Void)!

    override func configure(title: String, item: String, didTap: @escaping () -> Void) {
        titleLabel.text = title
        itemLabel.text = item
        self.didTapAction = didTap
        configureColor()
    }

    private func configureColor() {
        self.titleLabel.textColor =
            colorModel.themeColor.textColor
        self.itemLabel.textColor =
            colorModel.themeColor.textColor
        self.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
        self.selectedBackgroundView = CellSelectedBackgroundView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            didTapAction()
        }
    }
}
