//
//  Bool+Extension.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/09.
//

import Foundation

extension Bool {
    var toString: String {
        if self {
            return ModelLocator.trueString
        } else {
            return ModelLocator.falseString
        }
    }
}
