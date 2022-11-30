//
//  homeView.swift
//  QatarChallenge Watch App
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 24/11/22.
//

import SwiftUI
struct HomeView: View {
    let titlesText = ["Movimentos do dia", "Treino de hoje concluído"]
    let fractionList = ["0/3", "1/3", "2/3", "3/3"]
    let progressList = [0.00, 0.33, 0.66, 0.99]
    let buttonsTitle = ["Começar", "Recomeçar"]

    var body: some View {
        homeView(title: titlesText[0], fraction: fractionList[0], progressValueBar: Float(progressList[0]), buttonTitle: buttonsTitle[0])
//
//        homeView(title: titlesText[0], fraction: fractionList[1], progressValueBar: Float(progressList[1]), buttonTitle: buttonsTitle[0])
//
//        homeView(title: titlesText[0], fraction: fractionList[2], progressValueBar: Float(progressList[2]), buttonTitle: buttonsTitle[0])
        
//        homeView(title: titlesText[1], fraction: fractionList[3], progressValueBar: Float(progressList[3]), buttonTitle: buttonsTitle[1])
    }
}

struct homeView: View {
//    @AppStorage("_shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    
    let title: String
    let fraction: String
    let progressValueBar: Float
    let buttonTitle: String
    
    
    @State var shouldShowOnboarding: Bool = true
    @State var progressValue: Float = 0.0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 8){
                Text(title)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
//                    .padding(.all)
                
                Capsule()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                HStack(spacing: WKInterfaceDevice.current().screenBounds.size.width * 0.13){
                    VStack(alignment: .leading){
                        Text("1. Jab Direto")
                        Text("2. Chute Bla")
                        Text("3. Joelhada")
                    } //: VSTACK
                
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .padding(.bottom)
        
                    ProgressBar(progress: self.$progressValue, fraction: fraction)
                        .frame(width: 51, height: 51)
                        .padding(5.0).onAppear(){
                            self.progressValue = progressValueBar
                        }
                } //: HSTACK
                .padding(.horizontal)
              
                NavigationLink(
                    destination: ExercisesView(), label: {
                        Text(buttonTitle)
                    })
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding(.horizontal)
    
            } //: VSTACK
            .navigationTitle("Home") // nao sei pq nao aparece
        }.fullScreenCover(isPresented: $shouldShowOnboarding, content:{ OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            
        })
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.red
    let fraction: String
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 8.0)
                .opacity(0.2)
                .foregroundColor(Color.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0))
            
            Text(fraction)
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
