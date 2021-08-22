//
//  SettingRowInfo.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/15.
//

import UIKit

enum SettingRowInfo: Int, CaseIterable {
    case mainColor, review

    var title: String {
        switch self {
        case .mainColor: return "テーマカラーの変更"
        case .review: return "レビューする"
        }
    }

    var cellIdentifier: String {
        switch self {
        case .mainColor: return ThemeColorSettingCell.identifier
        case .review:  return SettingCell.identifier
        }
    }

    func didTapAction(_ viewController: UIViewController) -> (() -> Void) {
        switch self {
        case .mainColor:
            return { [weak viewController] in
                let nextVC = ColorPickerViewController()
                viewController?.present(nextVC, animated: true, completion: nil)
            }
        case .review:
            return { [weak viewController] in
                let alert = UIAlertController(title: "レビューしてください",
                                              message: "レビューしてください",
                                              preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { _ in
                    print("レビューしてくれたよ")
                }
                alert.addAction(action)
                viewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
}
