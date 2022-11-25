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
//let imageBg = Image(systemName: "OnboardingBG")
struct onboardingView: View {
    @State var shouldShowOnboarding: Bool = true
    var body: some View {
        //    NavigationView {
        VStack(alignment: .leading, spacing: 4) {
            Text("Home")
                .bold()
                .font(.system(size: 16))
        }
        //    }
        .fullScreenCover(isPresented: $shouldShowOnboarding, content: {
            OnboardingView()
                .navigationBarHidden(true)
        })
    }
}
// MARK: - Onboarding
struct OnboardingView: View {
    @State var shouldShowOnboarding: Bool = true
    var body: some View {
        TabView {
            OnboardingPageView(shouldShowOnboarding: $shouldShowOnboarding, image: true, showDismissButton: false, titulo: "Evolução no Esporte", text: "Iremos te instruir com movimentos específicos do Muay Thai.")
            OnboardingPageView(shouldShowOnboarding: $shouldShowOnboarding, image: false, showDismissButton: true, titulo: "Incentivo diário", text: "Todo dia você receberá 3 novos exercícios para lhe ajudar a aprender.")
        }
        //      .edgesIgnoringSafeArea(.all)
        //      .ignoresSafeArea()
        //      .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
        //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        //.edgesIgnoringSafeArea(.all)
        //      .ignoresSafeArea()
    }
}
struct onboardingView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingView()
    }
}
