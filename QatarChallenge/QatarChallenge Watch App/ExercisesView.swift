//
//  ExercisesView.swift
//  QatarChallenge Watch App
//
//  Created by mccl on 24/11/22.
//

import SwiftUI

struct ExercisesView: View {
    
    let movementsNames = ["Jab", "Chute", "Joelhada"]
    let firstMovementsImages = ["jab1", "chute1", "joelhada2"]
    let secondMovementsImages = ["jab2", "chute2", "joelhada3"]
    
    var body: some View {
        ScrollView {
            TabView {
                ExercisePageView(firstMovementImage: firstMovementsImages[0], secondMovementImage: secondMovementsImages[0], movementName: movementsNames[0], movementDuration: "30")
                
                ExercisePageView(firstMovementImage: firstMovementsImages[1], secondMovementImage: secondMovementsImages[1], movementName: movementsNames[1], movementDuration: "60")
                
                ExercisePageView(firstMovementImage: firstMovementsImages[2], secondMovementImage: secondMovementsImages[2], movementName: movementsNames[2], movementDuration: "45")
                
                

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
    let secondMovementImage: String
    let movementName: String
    let movementDuration: String
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(firstMovementImage)
                    Image(secondMovementImage)
        
                }
                
                Text(movementName)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                
                Text("Duração: \(movementDuration)s")
                    .font(.system(size: 16, weight: .regular, design: .default))
                
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
    
    
    
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
