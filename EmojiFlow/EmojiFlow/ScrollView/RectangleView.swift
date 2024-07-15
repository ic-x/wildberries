//
//  RectangleView.swift
//  EmojiFlow
//
//  Created by Clark Adams on 7/11/24.
//

import SwiftUI

struct RectangleView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: .infinity)
            .strokeBorder(
                LinearGradient(
                    gradient: Gradient(colors: [color.opacity(0.8), color, color.opacity(0.8)]),
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                style: StrokeStyle(lineWidth: .pi, dash: [8])
            )
    }
}

#Preview {
    RectangleView(color: .blue)
}
