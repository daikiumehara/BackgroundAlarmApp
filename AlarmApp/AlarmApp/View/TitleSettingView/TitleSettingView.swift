//
//  TitleSettingView.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/13.
//

import UIKit

class TitleSettingView: UIView {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var textField: UITextField!

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

    func configure(_ value: String) {
        textField.text = value
    }

    private func configureColor(_ view: UIView) {
        titleLabel.textColor = colorModel.themeColor.textColor
        textField.textColor = colorModel.themeColor.textColor
        textField.backgroundColor = colorModel.themeColor.cellBackgroundColor
        view.backgroundColor = colorModel.themeColor.cellBackgroundColor
        view.layer.borderWidth = 0.5
        view.layer.borderColor = colorModel.themeColor.textColor.cgColor
    }

    func getTitle() -> String {
        guard let title = self.textField.text else {
            return ""
        }
        return title
    }
}
