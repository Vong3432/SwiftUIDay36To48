//
//  Project9ChallengeView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 02/01/2022.
//

import SwiftUI

struct Arrow: InsettableShape {
    
    var thickness: Double = 1
    
    var animatableData: Double {
        get { thickness }
        set { thickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: 100))
        path.addLine(to: CGPoint(x: rect.midX / 1.2, y: 100))
        path.addLine(to: CGPoint(x: rect.midX / 1.2, y: 220))
        path.addLine(to: CGPoint(x: rect.midX * 1.2, y: 220))
        path.addLine(to: CGPoint(x: rect.midX * 1.2, y: 100))
        path.addLine(to: CGPoint(x: rect.maxX, y: 100))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.closeSubpath()
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow = self
        arrow.thickness = amount
        return arrow
    }
    
}

struct ColorCyclingRectangle: View {
    
    @State private var startPointX: Double = 0
    @State private var startPointY: Double = 0
    @State private var endPointX: Double = 0
    @State private var endPointY: Double = 1
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [.blue, .red],
                        startPoint: UnitPoint(x: startPointX, y: startPointY),
                        endPoint: UnitPoint(x: endPointX, y: endPointY)
                    )
                )
            .frame(width: 200, height: 200)
            
            Text("Start point X")
            Slider(value: $startPointX, in: 0...1)
            
            Text("Start point Y")
            Slider(value: $startPointY, in: 0...1)
            
            Text("End point X")
            Slider(value: $endPointX, in: 0...1)
            
            Text("End point Y")
            Slider(value: $endPointY, in: 0...1)
        }
    }
}

struct Project9ChallengeView: View {
    @State private var thickness: Double = 1
    @State private var isIncreasing: Bool = false
    
    var body: some View {
        VStack {
            Arrow(thickness: thickness)
                .stroke(.blue, lineWidth: thickness)
                .frame(width: 150, height: 150)
            
            Spacer()
            
            ColorCyclingRectangle()
            
            Spacer()
            
            Button("Increase") {
                withAnimation {
                    if !isIncreasing {
                        thickness = 5
                    } else {
                        thickness = 1
                    }
                }
                isIncreasing = !isIncreasing
            }
        }
    }
}

struct Project9ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        Project9ChallengeView()
    }
}
