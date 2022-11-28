//
//  ExercisesView.swift
//  QatarChallenge Watch App
//
//  Created by mccl on 24/11/22.
//

import SwiftUI

struct ExercisesView: View {
    
    let movementsNames = ["Jab", "Chute", "Joelhada"]
    let firstMovementsImages = ["soco", "chute", "joelhada"]
    
    
    var body: some View {
        ScrollView {
            TabView {
                
                NavigationView {
                    ExercisePageView(firstMovementImage: firstMovementsImages[0], movementName: movementsNames[0], movementDuration: "30")
                    
                }
                
                NavigationView {
                    ExercisePageView(firstMovementImage: firstMovementsImages[1], movementName: movementsNames[1], movementDuration: "60")
                }
                
                NavigationView {
                    ExercisePageView(firstMovementImage: firstMovementsImages[2], movementName: movementsNames[2], movementDuration: "45")
                }
                
                
                
                
            }.frame(
                width: WKInterfaceDevice.current().screenBounds.size.width,
                height: WKInterfaceDevice.current().screenBounds.size.height
            )
            .tabViewStyle(PageTabViewStyle())
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExercisePageView: View {
    
    let firstMovementImage: String
    let movementName: String
    let movementDuration: String
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            
            Image(firstMovementImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: WKInterfaceDevice.current().screenBounds.size.width * 0.48, height: WKInterfaceDevice.current().screenBounds.size.height * 0.30)
            
            
            
            Text(movementName)
                .font(.system(size: 15, weight: .semibold, design: .default))
            
            Text("Duração: \(movementDuration)s")
                .font(.system(size: 12, weight: .regular, design: .default))
            
            Spacer()
            
            NavigationLink(
                destination: TimerView(),
                label: {
                    Image(systemName: "play.fill")
                    
                        .font(.system(size: 24))
                    
                })
        }
    }
    
    
    
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
