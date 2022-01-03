//
//  CustomDivider.swift
//  SwiftUIDay36To48
//
//  Created by Vong Nyuksoon on 31/12/2021.
//

import SwiftUI


struct CustomDivider: View {
    var body: some View {
        // custom divider
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
