//
//  TimerView.swift
//  QatarChallenge Watch App
//
//  Created by Isabela Batista on 25/11/22.
//

import SwiftUI

struct TimerView: View {

    @Binding var exerciseName: String
    @State var isClicked = false
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    var body: some View {
        VStack{
            
            if self.stopWatchManager.secondsElapsed < 10 && self.stopWatchManager.secondsElapsed > 0 {
                Text("00:0\(stopWatchManager.secondsElapsed)")
                    .font(.system(size: 40, weight: .semibold))
                    .padding(28)
                
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
                
                
            } else if self.stopWatchManager.secondsElapsed >= 10 && self.stopWatchManager.secondsElapsed > 0 {
                Text("00:\(stopWatchManager.secondsElapsed)")
                    .font(.system(size: 40, weight: .semibold))
                    .padding(28)
                
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
            }
            
            if self.stopWatchManager.secondsElapsed <= 0 {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 56, weight: .regular, design: .default))
                    .padding(.all)
                
                if exerciseName == "Jab Direto" {
                    NavigationLink(
                        destination: ExercisesView(firstMovementImage: "joelhada", movementName: "Joelhada Direta", movementDuration: 30).navigationBarBackButtonHidden(true),
                        
                        label: {
                            Text("Próximo")
                            
                            
                        }).navigationBarBackButtonHidden(true)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                } else if exerciseName == "Joelhada Direta" {
                    NavigationLink(
                        destination: ExercisesView(firstMovementImage: "chute", movementName: "Chute Frontal", movementDuration: 30),
                        
                        label: {
                            Text("Próximo")
                            
                            
                        })
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                } else if exerciseName == "Chute Frontal" {
                    NavigationLink(
                        destination: doneView(),
                        
                        label: {
                            Text("Encerrar")
                            
                            
                        })
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                }
                
            }
            
        }.onAppear() {
            self.stopWatchManager.stop()
            self.stopWatchManager.start()
            
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(exerciseName: .constant("Jab Direto"))
    }
}

