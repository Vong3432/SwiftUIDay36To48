//
//  Project8LearningAppView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 30/12/2021.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct Person: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct Project8LearningAppView: View {
    
    private let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120)),
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    private let layoutModes = ["grid", "list"]
    
    @State private var currentLayout = "grid"
    
    var body: some View {
        NavigationView {
            
            Group {
                if currentLayout == "grid" {
                    GridLayout(astronauts: astronauts, missions: missions)
                        .padding([.horizontal, .bottom])
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .toolbar {
                ToolbarItem {
                    layoutModeBtn
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
    
    private var layoutModeBtn: some View {
        Button(action: changeLayoutMode) {
            Image(systemName: currentLayout == "grid" ? "square.grid.2x2" : "rectangle.grid.1x2")
        }
    }
    
    private func changeLayoutMode() {
        if currentLayout == "grid" {
            currentLayout = "list"
        } else {
            currentLayout = "grid"
        }
    }
}

struct Project8LearningAppView_Previews: PreviewProvider {
    static var previews: some View {
        Project8LearningAppView()
    }
}

extension Project8LearningAppView {
    private var gridWithScrollViewExample: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(0..<100, id: \.self) {
                        Text("Item \($0)")
                    }
                }
            }
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: layout) {
                    ForEach(1001..<1500, id: \.self) {
                        Text("Item \($0)")
                    }
                }
            }
        }
    }
    
    private var nestedCodableDataExample: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            
            // more code to come
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(Person.self, from: data) {
                print(user.address.street)
            }
        }
    }
    
    private var navigationViewExample: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
    
    private var scrollViewWithLongDataExample: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }.frame(maxWidth: .infinity)
        }
    }
    
    private var geometryExample: some View {
        GeometryReader { geo in
            Image("color")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height) // center in geometryreader
        }
    }
}
