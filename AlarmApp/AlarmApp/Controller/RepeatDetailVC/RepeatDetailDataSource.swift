//
//  RepeatDetailDataSource.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/13.
//

import UIKit

class RepeatDetailDataSource: NSObject, UITableViewDataSource {
    private weak var viewController: RepeatDetailViewController!

    init(_ viewController: RepeatDetailViewController) {
        self.viewController = viewController
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RepeatRowInfo.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
