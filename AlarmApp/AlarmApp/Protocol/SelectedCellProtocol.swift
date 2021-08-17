//
//  SelectedCellProtocol.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/16.
//

import Foundation

protocol SelectedCellProtocol {
    var didTapAction: (() -> Void)! { get set }

    func configure(_ title: String, _ didTapAction: @escaping () -> Void)
}
