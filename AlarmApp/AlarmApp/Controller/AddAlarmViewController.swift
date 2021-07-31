//
//  AddAlarmViewController.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/29.
//

import UIKit

class AddAlarmViewController: UIViewController {
    @IBOutlet private var topSafeAreaView: UIView!
    @IBOutlet private var navigationBar: UINavigationBar!
    @IBOutlet private var tableView: UITableView!

//    let dataSource: UITableViewDataSource?
//    let delegate: UITableViewDelegate?

    let colorModel = ModelLocator.colorModel
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNVBarColor()
    }

    override func viewDidAppear(_ animated: Bool) {
        configureNVBarColor()
    }

    func configureNVBarColor() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = colorModel.mainColor
        self.topSafeAreaView.backgroundColor = colorModel.mainColor
    }
}
