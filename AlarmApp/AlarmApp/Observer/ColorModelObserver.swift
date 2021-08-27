//
//  ColorModelObserver.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/24.
//

import UIKit

class ColorModelObserver: NSObject {
    @objc private weak var colorModelObserve: ColorModel?
    private var observation: NSKeyValueObservation?
    private var changedHandler: (() -> Void)!

    init(colorModel: ColorModel, changedHandler: @escaping () -> Void) {
        self.colorModelObserve = colorModel
        self.changedHandler = changedHandler
        super.init()

        observation = observe(\.colorModelObserve?.mainColor,
                              options: [], changeHandler: { _, _ in
                                self.changedHandler()
                              })
    }
}
