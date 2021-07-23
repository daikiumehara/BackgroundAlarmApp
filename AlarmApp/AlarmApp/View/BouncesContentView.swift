//
//  ExampleBouncesContentView.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/07/24.
//

import UIKit
import ESTabBarController_swift

class BouncesContentView: ESTabBarItemContentView {
    public var duration = 0.3

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = ThemeColor.subColor
        highlightTextColor = ThemeColor.mainColor
        iconColor = ThemeColor.subColor
        highlightIconColor = ThemeColor.mainColor
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func selectAnimation(animated: Bool, completion: (() -> Void)?) {
        self.bounceAnimation()
        completion?()
    }

    override func reselectAnimation(animated: Bool, completion: (() -> Void)?) {
        self.bounceAnimation()
        completion?()
    }

    func bounceAnimation() {
        let impliesAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        impliesAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        impliesAnimation.duration = duration * 2
        impliesAnimation.calculationMode = CAAnimationCalculationMode.cubic
        imageView.layer.add(impliesAnimation, forKey: nil)
    }
}
