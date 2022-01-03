//
//  ImagePaintLearningView.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 01/01/2022.
//

import SwiftUI

struct ImagePaintLearningView: View {
    var body: some View {
        Text("Hello World")
            .frame(width: 300, height: 300)
            .border(ImagePaint(image: Image("example"), scale: 0.5), width: 30)
    }
}

struct ImagePaintLearningView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintLearningView()
    }
}
