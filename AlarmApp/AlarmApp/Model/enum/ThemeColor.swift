//
//  ThemeColor.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

enum ThemeColor {
    case normal

    // Tabが選択されている時、アプリのメインカラー
    static var mainColor = #colorLiteral(red: 0.9832035899, green: 0.2547294796, blue: 0.3479702473, alpha: 1)
    // Tabが選択されていない時のカラー
    static var subColor = #colorLiteral(red: 0.6862131953, green: 0.686313808, blue: 0.6861912012, alpha: 1)

    var textColor: UIColor {
        switch self {
        case .normal:
            return #colorLiteral(red: 0.4391747713, green: 0.4392418265, blue: 0.4391601086, alpha: 1)
        }
    }
}
