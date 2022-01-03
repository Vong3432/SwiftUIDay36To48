//
//  DrawingLearningView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 01/01/2022.
//

//The key to understanding the difference between Path and Shape is reusability: paths are designed to do one specific thing, whereas shapes have the flexibility of drawing space and can also accept parameters to let us customise them further.

import SwiftUI


/// Custom Arch shape
/// InsettableShape - allows custom shape can draw inset border
struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        
        /**
         * SwiftUI 0° is start from right, if want to start from upwards, need to minus startAngle with 90°.
         * Hence, apply this adjustment can make the rotation logic feels more natural.
         */
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.minY),
            radius: rect.width / 2 - insetAmount,
            startAngle: modifiedStart,
            endAngle: modifiedEnd,
            clockwise: !clockwise // clockwise rotation in SwiftUI is different from what we normally know, it is opposite, hence add "!"
        )
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
    
    
}

struct DrawingLearningView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                
//                Circle()
//                    .strokeBorder(.blue, lineWidth: 40) // .strokeBorder draw border line inside
                
//                Path { path in
//                    path.move(to: CGPoint(x: 200, y: 100))
//                    path.addLine(to: CGPoint(x: 100, y: 300))
//                    path.addLine(to: CGPoint(x: 300, y: 300))
//                    path.addLine(to: CGPoint(x: 200, y: 100)) // link to starting path
//                    //            path.closeSubpath()
//                }
//                //        .stroke(.blue, lineWidth: 5)
//                .stroke(.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
//
                Arc(startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
                    .strokeBorder(.purple, lineWidth: 40)
//
//                Triangle()
//                    .stroke(.red, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
//                    .frame(width: 200, height: 200)
            }
            
            
            .navigationTitle("Shape")
        }
    }
}

struct DrawingLearningView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingLearningView()
    }
}
