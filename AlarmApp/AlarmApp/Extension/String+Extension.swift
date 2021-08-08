//
//  String+Extension.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/09.
//

import Foundation

extension String {
    var toBool: Bool {
        return self == ModelLocator.trueString
    }
}
