//
//  SoundCell.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/05.
//

import UIKit
import AVFoundation

class SoundCell: UITableViewCell {

    var soundData: SoundData!
    var player: AVAudioPlayer!
    
    @IBOutlet private var checkmark: UIImageView!
    @IBOutlet private var soundLabel: UILabel!
    @IBOutlet private var playButton: UIButton!

    func configure(_ data: SoundData) {
        self.soundData = data
        self.soundLabel.text = data.soundName
    }

    @IBAction private func didTapPlayButton(_ sender: Any) {
        let url = URL(fileURLWithPath: "Sounds/\(soundData.fileName)")
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("サウンドファイルが見つかりませんでした。")
        }
    }
}
