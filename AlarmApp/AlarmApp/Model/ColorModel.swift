//
//  CommonModel.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

class ColorModel {
    // Tabが選択されている時、アプリのメインカラー
    var mainColor = #colorLiteral(red: 0.9832035899, green: 0.2547294796, blue: 0.3479702473, alpha: 1)
//    var mainColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    // Tabが選択されていない時のカラー
    var subColor = #colorLiteral(red: 0.6862131953, green: 0.686313808, blue: 0.6861912012, alpha: 1)
    var themeColor = ThemeColor.normal
}
