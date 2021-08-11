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
        guard let path = Bundle.main.path(forAuxiliaryExecutable: soundData.fileName) else {
            print("音源ファイルが見つかりません")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player.play()
        } catch {
            print("サウンドの再生でエラーが発生しました \(error)")
        }
    }
}
