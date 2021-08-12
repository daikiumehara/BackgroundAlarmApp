//
//  TimeSettingView.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/31.
//

import UIKit

class TimeSettingView: UIView {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var datePicker: UIDatePicker!

    private var colorModel = ModelLocator.colorModel

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    private func loadNib() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        configureColor(view)
        self.addSubview(view)
    }

    private func configureColor(_ view: UIView) {
        view.backgroundColor = colorModel.themeColor.cellBackgroundColor
        self.titleLabel.textColor = colorModel.themeColor.textColor
    }

    func getTime() -> Time {
        let date = datePicker.date
        return CustomFormatter.dateToTime(date)
    }
}
