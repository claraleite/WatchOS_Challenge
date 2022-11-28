//
//  onboardingView.swift
//  QatarChallenge Watch App
//
//  Created by Cecília on 23/11/22.
//

import SwiftUI
let backgroundGradient = LinearGradient(
    colors: [Color.black, Color(red: 0.17, green: 0.17, blue: 0.17)],
    startPoint: .topLeading, endPoint: .bottomTrailing)

// MARK: - Onboarding
struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        TabView {
            OnboardingPageView(shouldShowOnboarding: $shouldShowOnboarding, image: true, showDismissButton: false, titulo: "Evolução no Esporte", text: "Iremos te instruir com movimentos específicos do Muay Thai.")
            OnboardingPageView(shouldShowOnboarding: $shouldShowOnboarding, image: false, showDismissButton: true, titulo: "Incentivo diário", text: "Todo dia você receberá 3 novos exercícios para lhe ajudar a aprender.")
        }

    }
}
struct onboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(shouldShowOnboarding: .constant(true))
    }
}
