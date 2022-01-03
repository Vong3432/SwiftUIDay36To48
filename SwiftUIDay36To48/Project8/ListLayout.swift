//
//  ListLayout.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 01/01/2022.
//

import SwiftUI

struct ListLayout: View {
    
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 52, height: 52)
                        .cornerRadius(18)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(mission.formattedDate)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.trailing)
            .listRowInsets(EdgeInsets())
        }.listStyle(.plain)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        NavigationView {
            ListLayout(astronauts: astronauts, missions: missions)
            
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}
