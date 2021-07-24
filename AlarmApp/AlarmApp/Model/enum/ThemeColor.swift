//
//  ThemeColor.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

enum ThemeColor {
    case normal

    var textColor: UIColor {
        switch self {
        case .normal:
            return #colorLiteral(red: 0.4391747713, green: 0.4392418265, blue: 0.4391601086, alpha: 1)
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .normal:
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}
