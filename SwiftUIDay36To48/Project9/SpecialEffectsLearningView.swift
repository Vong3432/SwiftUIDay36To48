//
//  SpecialEffectsLearningView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 02/01/2022.
//

import SwiftUI

struct SpecialEffectsLearningView: View {
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Image("example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct SpecialEffectsLearningView_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsLearningView()
    }
}
