//
//  AlarmViewFlowLayout.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit

class AlarmViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        guard let collectionView = self.collectionView else { return }
        let viewWidth = collectionView.bounds
            .inset(by: collectionView.layoutMargins).size.width
        let minWidth = CGFloat(250.0)
        let maxItem = Int(viewWidth / minWidth)
        let cellWidth = (viewWidth / CGFloat(maxItem))
        self.itemSize = CGSize(width: cellWidth, height: 90.0)
        self.sectionInset = UIEdgeInsets(top: self.minimumLineSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }
}
