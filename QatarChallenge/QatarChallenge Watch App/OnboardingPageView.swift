//
//  OnboardingPageView.swift
//  QatarChallenge Watch App
//
//  Created by Cecília on 23/11/22.
//

import SwiftUI
struct OnboardingPageView: View {
    
    @Binding var shouldShowOnboarding: Bool
    
    let image: Bool
    let showDismissButton: Bool
    let titulo: String
    let text: String
    var body: some View {
        ZStack(alignment: .center) {
            backgroundGradient
            VStack {
                if image {
                    Image("OnboardingImg")
                }
                VStack(alignment: .leading, spacing: WKInterfaceDevice.current().screenBounds.size.height * 0.01) {
                    Text(titulo)
                        .font(.system(size: 14))
                        .bold()
                        .frame(alignment: .leading)
                        .padding(.top, WKInterfaceDevice.current().screenBounds.size.height * 0.01)
                    Text(text)
                        .font(.system(size: 12))
                }
                if showDismissButton {
                    Button(action: {
                        shouldShowOnboarding.toggle()
                        
                    }, label: {
                        Text("Vamos lá")
                            .foregroundColor(.white)
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .padding(.top, WKInterfaceDevice.current().screenBounds.size.height * 0.13)
//                    .padding(.leading, WKInterfaceDevice.current().screenBounds.size.height * 0.09)
//                    .padding(.trailing, WKInterfaceDevice.current().screenBounds.size.height * 0.09)
                }
                
                
                //Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
