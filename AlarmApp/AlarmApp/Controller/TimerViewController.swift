//
//  TimerViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class TimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    static func instantiate() -> TimerViewController {
        guard let vc = UIStoryboard(name: "Timer", bundle: nil)
                .instantiateInitialViewController() as? TimerViewController else {
            fatalError("storyboardが見つかりません")
        }
        vc.tabBarItem = ESTabBarItem(title: "タイマー",
                                     image: UIImage(systemName: "timer"),
                                     selectedImage: UIImage(systemName: "timer"),
                                     tag: 2)
        return vc
    }
}
