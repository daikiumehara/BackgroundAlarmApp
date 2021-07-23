//
//  SettingViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - instantiate
extension SettingViewController {
    static func instantiate() -> SettingViewController {
        guard let vc = UIStoryboard(name: "Setting", bundle: nil)
                .instantiateInitialViewController() as? SettingViewController else {
            fatalError("storyboardが見つかりません")
        }
        vc.tabBarItem = ESTabBarItem(title: "設定",
                                     image: UIImage(systemName: "gearshape"),
                                     selectedImage: UIImage(systemName: "gearshape"),
                                     tag: 3)
        return vc
    }
}
