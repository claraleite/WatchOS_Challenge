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
                VStack(alignment: .leading, spacing: 4) {
                    Text(titulo)
                        .font(.system(size: 14))
                        .bold()
                        .frame(alignment: .leading)
                        .padding(.top, 4)
                    Text(text)
                        .font(.system(size: 12))
                }
                if showDismissButton {
                    Button(action: {
                        shouldShowOnboarding.toggle()
                        
                    }, label: {
                        Text("Vamos lá")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .semibold))
                    })
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 1.00, green: 0.23, blue: 0.19))
                    .padding(.top,28)
                    .padding(.leading,16)
                    .padding(.trailing,16)
                }
                
                
                //Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
