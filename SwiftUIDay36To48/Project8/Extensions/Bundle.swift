//
//  Bundle.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 30/12/2021.
//

import Foundation

extension Bundle {
    
    
    /// Decode bundle file with generic type
    /// - Returns: Decoded data with generic type
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        
        return decoded
    }
}
