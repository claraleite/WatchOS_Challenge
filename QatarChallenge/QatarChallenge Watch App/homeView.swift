//
//  homeView.swift
//  QatarChallenge Watch App
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 24/11/22.
//

import SwiftUI

struct homeView: View {
//    @AppStorage("_shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @State var shouldShowOnboarding: Bool = true
    
    @State var progressValue: Float = 0.0
    var body: some View {
        NavigationView{
            VStack{
                Text("Movimentos do dia")
                //Falta colocar tipo de fonte
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
//                    .padding()
//                Spacer()
                Capsule()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("1. Jab Direto")
                        Text("2. Chute Bla")
                        Text("3. Joelhada")
                    } //: VSTACK
                    //Falta colocar tipo de fonte
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    
                    
                    ProgressBar(progress: self.$progressValue)
                        .frame(width: 51, height: 51)
                        .padding(20.0).onAppear(){
                            self.progressValue = 0.30
                        }
                } //: HSTACK
              
                NavigationLink(
                    destination: ExercisesView(),
                    
                    label: {
                        Text("Começar")
                        
                        
                    })
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                
            } //: VSTACK
            .navigationTitle("Home") // nao sei pq nao aparece
        }.fullScreenCover(isPresented: $shouldShowOnboarding, content:{ OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            
        })
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.red
    
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
            
            Text("1/3")
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
