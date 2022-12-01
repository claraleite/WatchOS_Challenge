//
//  ExercisesView.swift
//  QatarChallenge Watch App
//
//  Created by mccl on 24/11/22.
//

import SwiftUI

struct ExercisesView: View {
    
    let firstMovementImage: String
    @State var movementName: String
    let movementDuration: Int
    
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
                destination: TimerView(exerciseName: $movementName),
                label: {
                    Image(systemName: "play.fill")
                    
                        .font(.system(size: 24))
                })
        }
    }
    
    
    
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(firstMovementImage: "soco", movementName: "JAB DIRETO", movementDuration: 30)
    }
}
