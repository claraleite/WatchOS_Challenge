//
//  defaultButton.swift
//  QatarChallenge Watch App
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 28/11/22.
//

import Foundation
import SwiftUI

struct defaultButton: View {
    var title: String
    var backgroundColor: Color

    var body: some View {
        Text(title)
            .frame(width: 144, height: 44)
            .font(.system(size: 15, weight: .regular, design: .default))
            .background(backgroundColor)
            .foregroundColor(.white)
    }
}
