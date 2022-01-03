//
//  AstronautView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 31/12/2021.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            AstronautView(astronaut: astronauts["grissom"]!)
        }
        .preferredColorScheme(.dark)
    }
}
