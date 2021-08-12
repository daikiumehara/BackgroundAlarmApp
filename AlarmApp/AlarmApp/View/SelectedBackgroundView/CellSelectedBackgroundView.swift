//
//  CellSelectedBackgroundView.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/12.
//

import UIKit

class CellSelectedBackgroundView: UIView {
    private var colorModel = ModelLocator.colorModel

    init() {
        super.init(frame: .zero)
        configureColor()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func configureColor() {
        self.backgroundColor = colorModel.themeColor.backgroundColor
    }
}
