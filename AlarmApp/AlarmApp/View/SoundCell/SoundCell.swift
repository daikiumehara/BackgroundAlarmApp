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

    var soundData: SoundData!
    var tapPlayButton: ((String) -> Void)!
    var player: AVAudioPlayer?

    func configure(_ data: SoundData, didTapPlayButton: @escaping (String) -> Void) {
        self.soundData = data
        self.soundLabel.text = data.soundName
        self.tapPlayButton = didTapPlayButton
    }

    @IBAction private func didTapPlayButton(_ sender: Any) {
        tapPlayButton(soundData.fileName)
    }
}
