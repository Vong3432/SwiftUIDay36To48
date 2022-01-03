//
//  Activity.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 03/01/2022.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID().uuidString
    let name: String
    let description: String
    var completedCount: Int = 0
}
