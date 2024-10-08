//
//  CustomBackground.swift
//  HikeAdvanceApp
//
//  Created by Ricky Primayuda Putra on 09/10/24.
//

import SwiftUI

struct CustomBackground: View {
    var body: some View {
        ZStack {
            
            // MARK: DEPTH
            
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: LIGHT
            
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: SURFACE
            
            LinearGradient(
                colors: [
                    Color.customGreenLight,
                    Color.customGreenMedium
                ],
                startPoint: .top, endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackground()
        .padding()
}
