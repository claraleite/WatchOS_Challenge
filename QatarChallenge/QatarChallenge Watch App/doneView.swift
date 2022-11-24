//
//  doneView.swift
//  QatarChallenge Watch App
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 24/11/22.
//

import SwiftUI

struct doneView: View {
    var body: some View {
        ZStack{
            Image("party")
                .opacity(0.2)
            
            VStack{
                Image("trophy")
                    .padding(24.0)
                
                Text("Você conseguiu!")
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
            }//:VSTACK
        }//:ZSTACK
    }
}

struct doneView_Previews: PreviewProvider {
    static var previews: some View {
        doneView()
    }
}
