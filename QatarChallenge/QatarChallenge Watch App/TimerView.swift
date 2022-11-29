//
//  TimerView.swift
//  QatarChallenge Watch App
//
//  Created by Isabela Batista on 25/11/22.
//

import SwiftUI

struct TimerView: View {

    @State var isClicked = false
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        VStack{
            
            if self.stopWatchManager.secondsElapsed < 10 {
                Text("00:0\(stopWatchManager.secondsElapsed)")
                    .font(.system(size: 40, weight: .semibold))
                    .padding(28)
            } else {
                Text("00:\(stopWatchManager.secondsElapsed)")
                    .font(.system(size: 40, weight: .semibold))
                    .padding(28)
            }
            
            
            HStack (spacing: 16){
                
                
                Button(action: {
                    
                    self.stopWatchManager.stop()
                    self.stopWatchManager.start()
                    
                }){ HStack {
                    
                    Image (systemName: "arrow.counterclockwise")
                        .resizable()
                        .frame(width: WKInterfaceDevice.current().screenBounds.size.width * 0.13, height: WKInterfaceDevice.current().screenBounds.size.height * 0.12)
                    
                }
                }  .buttonStyle(.plain)
                
                Button(action: {
                    isClicked.toggle()
                    
                    if isClicked {
                        self.stopWatchManager.pause()
                    } else {
                        self.stopWatchManager.start()
                    }
                    
                    
                }){ HStack {
                    
                    Image (systemName: isClicked ? "play.fill" : "pause.fill")
                        .resizable()
                        .frame(width: WKInterfaceDevice.current().screenBounds.size.width * 0.13, height: WKInterfaceDevice.current().screenBounds.size.height * 0.13)
                    
                }
                }.buttonStyle(.plain)
                
            }
        }.onAppear() {
            self.stopWatchManager.start()
        }
    }
}



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

