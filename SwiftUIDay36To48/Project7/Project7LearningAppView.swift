//
//  Project7LearningAppView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 28/12/2021.
//

import SwiftUI


// Codable - converting objects into plain text and back again
struct User: Codable {
    let firstName: String
    let lastName: String
}

struct Project7LearningAppView: View {
    
    @State private var numbers = [Int]()
//    @State private var currentNumber = UserDefaults.standard.integer(forKey: "Current")
    @AppStorage("Current") private var currentNumber = 0
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }.onDelete(perform: removeRows)
                }
                
                Text("Current number: \(currentNumber)")
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
//                    UserDefaults.standard.set(currentNumber, forKey: "Current")
                }
                
                Button("Save User") {
                    let encoder = JSONEncoder()

                    if let data = try? encoder.encode(user) {
                        UserDefaults.standard.set(data, forKey: "UserData")
                    }
                }
                
                
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct Project7LearningAppView_Previews: PreviewProvider {
    static var previews: some View {
        Project7LearningAppView()
    }
}
