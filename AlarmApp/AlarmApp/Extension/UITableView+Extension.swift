//
//  UITableView+Extension.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/06.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) {
        self.register(UINib(nibName: T.identifier, bundle: nil),
                      forHeaderFooterViewReuseIdentifier: T.identifier)
    }


    func dequeueReusableCell<T: UITableViewCell>(withCellType: T.Type,
                                                      for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier,
                                                  for: indexPath) as? T else {
            fatalError("セルが存在しません")
        }
        return cell
    }
}
