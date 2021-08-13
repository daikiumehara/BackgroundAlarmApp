//
//  RepeatDetailViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/13.
//

import UIKit

class RepeatDetailViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    private var dataSource: RepeatDetailDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self

    }
}

// MARK: - instantiate
extension RepeatDetailViewController {
    static func instantiate() -> RepeatDetailViewController {
        guard let initialVC = UIStoryboard(name: "RepeatDetail", bundle: nil)
                .instantiateInitialViewController() as? RepeatDetailViewController else {
            fatalError("StoryBoardが見つかりませんでした")
        }
        initialVC.dataSource = RepeatDetailDataSource(initialVC)
        return initialVC
    }
}

// MARK: - UITableViewDelegate
extension RepeatDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}
