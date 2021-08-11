//
//  SoundPlayer.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/11.
//

import AVFoundation

class SoundPlayer {
    private var player: AVAudioPlayer?

    func playSound(_ fileName: String) {
        guard let path = Bundle.main.path(forAuxiliaryExecutable: fileName) else {
            print("音源ファイルが見つかりません")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player?.play()
        } catch {
            print("サウンドの再生でエラーが発生しました \(error)")
        }
    }
}
