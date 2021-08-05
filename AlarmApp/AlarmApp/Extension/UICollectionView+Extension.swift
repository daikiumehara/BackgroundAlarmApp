//
//  UICollectionView+Extension.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ type: T.Type) {
        self.register(UINib(nibName: T.identifier, bundle: nil),
                      forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(withCellType: T.Type,
                                                      indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.identifier,
                                                  for: indexPath) as? T else {
            fatalError("セルが存在しません")
        }
        return cell
    }
}
