//
//  StopWatchManager.swift
//  QatarChallenge Watch App
//
//  Created by mccl on 29/11/22.
//

import Foundation
import SwiftUI

class StopWatchManager: ObservableObject {
    
    enum stopWatchMode {
        case running
        case stopped
        case paused
    }
    @Published var mode: stopWatchMode = .stopped
    
    @Published var secondsElapsed = 10
    var timer = Timer()
    
    func start() {
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.secondsElapsed -= 1
            if self.secondsElapsed < 0 {
                self.pause()
            }
            
        }
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func stop() {
        timer.invalidate()
        secondsElapsed = 10
        mode = .stopped
    }
    
    func isDone() {
        timer.invalidate()
    }
}
