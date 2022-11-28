//
//  NextPage.swift
//  QatarChallenge Watch App
//
//  Created by mccl on 28/11/22.
//

import SwiftUI

struct NextPageView: View {
    var body: some View {
        VStack(spacing: WKInterfaceDevice.current().screenBounds.size.height * 0.08) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 56, weight: .regular, design: .default))
            
            NavigationLink(
                destination: ExercisesView(),
                
                label: {
                    Text("Próximo")
                    
                    
                })
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
    }
}

struct NextPage_Previews: PreviewProvider {
    static var previews: some View {
        NextPageView()
    }
}
