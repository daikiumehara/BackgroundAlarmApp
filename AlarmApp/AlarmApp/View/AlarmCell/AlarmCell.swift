//
//  AlarmCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

class AlarmCell: UICollectionViewCell {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var alameNameLabel: UILabel!
    @IBOutlet private var bellImage: UIImageView!
    @IBOutlet private var alarmSwitch: UISwitch!

    static var identifier: String { String(describing: self) }
    static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }

    func configure() {
        self.layer.cornerRadius = 20.0
        self.backgroundColor = ColorModel.themeColor.backgroundColor
        self.layer.borderWidth = 0.5
        self.titleLabel.textColor = ColorModel.themeColor.textColor
        self.timeLabel.textColor = ColorModel.themeColor.textColor
        self.alameNameLabel.textColor = ColorModel.themeColor.textColor
        self.bellImage.tintColor = ColorModel.themeColor.textColor
        self.alarmSwitch.tintColor = ColorModel.mainColor
        self.alarmSwitch.onTintColor = ColorModel.mainColor
    }
}
