//
//  doneView.swift
//  QatarChallenge Watch App
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 24/11/22.
//

import SwiftUI

struct doneView: View {
    
    @State var pushNewView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack{
                
                NavigationLink(destination: concludedHomeView().navigationBarBackButtonHidden(true), isActive: $pushNewView) {
                    EmptyView()
                    
                }.navigationTitle("")
                    .toolbar(.hidden)
                    .buttonStyle(.plain)
                
                Image("party")
                    .opacity(0.2)
                
                VStack{
                    Image("trophy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: WKInterfaceDevice.current().screenBounds.size.width * 0.70, height: WKInterfaceDevice.current().screenBounds.size.height * 0.50)
                        .padding(WKInterfaceDevice.current().screenBounds.size.height * 0.06)
                    
                    Text("Você conseguiu!")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                }
            }
        }//navView
        
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0) {
                self.pushNewView.toggle()
            }
            
            //                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            //                        pushNewView = true
            //                    }
        }
        
        
    }
}


struct doneView_Previews: PreviewProvider {
    static var previews: some View {
        doneView()
    }
}
