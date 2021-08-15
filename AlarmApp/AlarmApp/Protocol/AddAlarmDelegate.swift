//
//  AddAlarmDelegate.swift
//  AlarmApp
//
//  Created by daiki umehara on 2021/08/14.

import Foundation

protocol SoundDetailDelegate: NSObject {
    func chengeSoundData(_ data: SoundData)
}

protocol RepeatDetailDelegate: NSObject {
    func chengeRepeatDate(_ data: [Bool])
}

protocol SnoozeDelegate {
    func chengeSnooze(_ data: Bool)
}

protocol TitleDelegate {
    func chengeTitle(_ data: String)
}

protocol TimeDelegate {
    func chengeTime(_ data: Time)       
}
