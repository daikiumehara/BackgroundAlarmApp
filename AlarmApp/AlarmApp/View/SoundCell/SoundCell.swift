//
//  SoundCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit
import AVFoundation

class SoundCell: UITableViewCell {
    @IBOutlet private var checkmark: UIImageView!
    @IBOutlet private var soundLabel: UILabel!
    @IBOutlet private var playButton: UIButton!

    private var soundData: SoundData!
    private var tapPlayButton: ((String) -> Void)!
    private var player: AVAudioPlayer?
    private var colorModel = ModelLocator.colorModel

    func configure(_ data: SoundData, didTapPlayButton: @escaping (String) -> Void) {
        self.soundData = data
        self.soundLabel.text = data.soundName
        self.tapPlayButton = didTapPlayButton
        configureColor()
    }

    private func configureColor() {
        self.backgroundColor =
            colorModel.themeColor.cellBackgroundColor
        self.playButton.tintColor =
            colorModel.mainColor
        self.checkmark.tintColor =
            colorModel.mainColor
        self.soundLabel.textColor =
            colorModel.themeColor.textColor
        self.selectedBackgroundView = CellSelectedBackgroundView()
    }

    @IBAction private func didTapPlayButton(_ sender: Any) {
        tapPlayButton(soundData.fileName)
    }

    func showCheckmark() {
        checkmark.isHidden = false
    }

    func hiddenCheckmark() {
        checkmark.isHidden = true
    }
}
