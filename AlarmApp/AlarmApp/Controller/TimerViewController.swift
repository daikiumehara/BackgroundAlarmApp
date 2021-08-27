//
//  TimerViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import Combine
import ESTabBarController_swift

class TimerViewController: UIViewController {
    @IBOutlet private var startAndStopButton: TimerButton!

    private var colorModel = ModelLocator.colorModel
    private var cancellable: Cancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonConfigure()
        configureColor()
    }

    private func configureColor() {
    }

    private func configureTabItem() {
        let contentView = BouncesContentView()
        contentView.configure(self.colorModel)
        self.tabBarItem = ESTabBarItem(contentView,
                                     title: "タイマー",
                                     image: UIImage(systemName: "timer"),
                                     selectedImage: UIImage(systemName: "timer"),
                                     tag: 2)
    }

    private func configureBinding() {
        self.cancellable = colorModel.$mainColor
            .sink(receiveValue: { [weak self] _ in
                self?.configureColor()
                self?.configureTabItem()
            })
    }

    private func buttonConfigure() {
    }
}

// MARK: - instantiate
extension TimerViewController {
    static func instantiate() -> TimerViewController {
        guard let initialVC = UIStoryboard(name: "Timer", bundle: nil)
                .instantiateInitialViewController() as? TimerViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.configureTabItem()
        initialVC.configureBinding()
        return initialVC
    }
}
