//
//  ColorPickerViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/16.
//

import UIKit

class ColorPickerViewController: UIColorPickerViewController {
    private var colorModel = ModelLocator.colorModel

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedColor = colorModel.mainColor
        self.delegate = self
    }
}

// MARK: - instantiate
extension ColorPickerViewController {
    static func instantiate() -> ColorPickerViewController {
        let initialVC = ColorPickerViewController()
        return initialVC
    }
}

// MARK: - UIColorPickerViewControllerDelegate
extension ColorPickerViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.colorModel.mainColor = self.selectedColor
        print("selectColor")
    }
}
