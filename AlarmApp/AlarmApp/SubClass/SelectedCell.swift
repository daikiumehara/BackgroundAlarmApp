//
//  SelectedCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/16.
//

import UIKit

class SelectedCell: UITableViewCell, SelectedCellProtocol {
    var didTapAction: (() -> Void)!

    func configure(_ title: String, _ didTapAction: @escaping () -> Void) {}
}
