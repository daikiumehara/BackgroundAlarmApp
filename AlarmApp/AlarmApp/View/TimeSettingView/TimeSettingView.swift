//
//  TimeSettingView.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/31.
//

import UIKit

class TimeSettingView: UIView {
    @IBOutlet private var label: UILabel!
    @IBOutlet private var datePicker: UIDatePicker!

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
        self.addSubview(view)
    }

    func getTime() -> Time {
        let date = datePicker.date
        return CustomFormatter.dateToTime(date)
    }
}
