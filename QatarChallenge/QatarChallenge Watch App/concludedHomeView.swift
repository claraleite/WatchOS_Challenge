//
//  concludedHomeView.swift
//  QatarChallenge Watch App
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 24/11/22.
//

import SwiftUI

struct concludedHomeView: View {
    @State var progressValue: Float = 0.0
    var body: some View {
        ZStack{
            Image("party")
                .ignoresSafeArea()
                .opacity(0.2)
            VStack{
                
                Text("Parabéns! Você concluiu o treino de hoje.")
                    .font(.system(size: 12, weight: .semibold, design: .default))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                
                
                Capsule()
                    .frame(height: 1)
                    .foregroundColor(.gray)
//                    .padding()
                
                HStack(spacing: WKInterfaceDevice.current().screenBounds.size.width * 0.13){
                    VStack(alignment: .leading){
                        Text("1. Jab Direto")
                        Text("2. Chute Bla")
                        Text("3. Joelhada")
                    } //: VSTACK
                    //Falta colocar tipo de fonte
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    
                    
                    ConcludedProgressBar(progress: self.$progressValue)
                        .frame(width: 51, height: 51)
                        .padding(5.0).onAppear(){
                            self.progressValue = 0.99
                        }
                    
                    
                } //: HSTACK
                
                NavigationLink(
                    destination: ExercisesView(),
                    label: {
                        Text("Recomeçar")
                    })
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding(.horizontal)
                
            } //: VSTACK
            .navigationTitle("Home") 
            .padding(.all)
        }//: ZSTACK
    }
}
struct ConcludedProgressBar: View {
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
                .animation(.easeInOut(duration: 2.0) )
            Image(systemName: "checkmark")
            
        }
    }
}

struct concludedHomeView_Previews: PreviewProvider {
    static var previews: some View {
        concludedHomeView()
    }
}
