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
        self.layer.borderColor = 
        self.layer.cornerRadius = 20.0
    }
}
