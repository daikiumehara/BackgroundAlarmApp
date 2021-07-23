//
//  AlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class AlarmViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: - instantiate
extension AlarmViewController {
    static func instantiate() -> AlarmViewController {
        guard let vc = UIStoryboard(name: "Alarm", bundle: nil)
                .instantiateInitialViewController()as? AlarmViewController else {
            fatalError("storyboardが見つかりません")
        }
        vc.tabBarItem = ESTabBarItem(title: "アラーム",
                                     image: UIImage(systemName: "alarm"),
                                     selectedImage: UIImage(systemName: "alarm"),
                                     tag: 1)
        return vc
    }
}
