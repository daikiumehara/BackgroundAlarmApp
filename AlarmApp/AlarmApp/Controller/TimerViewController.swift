//
//  TimerViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class TimerViewController: UIViewController {
    @IBOutlet private var startAndStopButton: TimerButton!
    private var colorModel = ModelLocator.colorModel
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonConfigure()
    }

    private func buttonConfigure() {
        startAndStopButton.configure(color: #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)) {
        }
    }
}

// MARK: - instantiate
extension TimerViewController {
    static func instantiate() -> TimerViewController {
        guard let initialVC = UIStoryboard(name: "Timer", bundle: nil)
                .instantiateInitialViewController() as? TimerViewController else {
            fatalError("storyboardが見つかりません")
        }
        let contentView = BouncesContentView()
        contentView.configure(initialVC.colorModel)
        initialVC.tabBarItem = ESTabBarItem(contentView,
                                     title: "タイマー",
                                     image: UIImage(systemName: "timer"),
                                     selectedImage: UIImage(systemName: "timer"),
                                     tag: 2)
        return initialVC
    }
}
