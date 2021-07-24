//
//  AlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class AlarmViewController: UIViewController {
    @IBOutlet private var alarmView: UICollectionView!

    private let alarmViewDelegate = AlarmViewDelegate()
    private let alarmViewDataSource = AlarmViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    func configureCollectionView() {
        alarmView.register(AlarmCell.nib,
                                forCellWithReuseIdentifier: AlarmCell.identifier)
        alarmView.delegate = alarmViewDelegate
        alarmView.dataSource = alarmViewDataSource
        alarmView.collectionViewLayout = AlarmViewLayout()
    }
}

// MARK: - instantiate
extension AlarmViewController {
    static func instantiate() -> AlarmViewController {
        guard let initialVC = UIStoryboard(name: "Alarm", bundle: nil)
                .instantiateInitialViewController()as? AlarmViewController else {
            fatalError("storyboardが見つかりません")
        }
        initialVC.tabBarItem = ESTabBarItem(BouncesContentView(),
                                     title: "アラーム",
                                     image: UIImage(systemName: "alarm"),
                                     selectedImage: UIImage(systemName: "alarm"),
                                     tag: 1)
        return initialVC
    }
}
