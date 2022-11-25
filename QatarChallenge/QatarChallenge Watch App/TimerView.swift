//
//  TimerView.swift
//  QatarChallenge Watch App
//
//  Created by Isabela Batista on 25/11/22.
//

import SwiftUI

struct TimerView: View {
    @State var start = false
    @State var countDownTimer = 30
    @State var timerRunning = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        VStack{
            Text("00:\(countDownTimer)")
                .onReceive(timer){ _ in
                    if countDownTimer > 0 && timerRunning {
                        countDownTimer -= 1
                    } else {
                        timerRunning = false
                    }
                }
                .font(.system(size: 40, weight: .semibold))
                .padding(28)
            
            HStack (spacing: 16){
                
                
                Button(action: {
                    
                    (self.countDownTimer = 30)
                    
                }){ HStack {
                    
                    Image (systemName: "arrow.counterclockwise")
                        .resizable()
                        .frame(width: 22, height: 25)
   
                }
                }  .buttonStyle(.plain)
                
                Button(action: {
                    
                    (self.timer.upstream.connect().cancel())
                    
                }){ HStack {
                    
                    Image (systemName: "playpause.fill")
                        .resizable()
                        .frame(width: 32, height: 18)
                    
                }
                }.buttonStyle(.plain)
              
                Button(action: {
                    (self.timer.upstream.connect().cancel())
                }){ HStack {
                    
                    Image (systemName: "forward.fill")
                    .resizable()
                    .frame(width: 32, height: 18)
                    
                }
                    
                }.buttonStyle(.plain)
            }
        }
    }
}



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

