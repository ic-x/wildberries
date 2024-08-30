//
//  LikeButtonView.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct LikeButton: View {
    @Binding var isLiked: Bool
    @State private var isPressed: Bool = false
    public var action: () -> Void

    public init(isLiked: Binding<Bool>, action: @escaping () -> Void) {
        self._isLiked = isLiked
        self.action = action
    }

    public var body: some View {
        Button(action: {
            let animationDuration = isLiked ? 0.2 : 0.1

            withAnimation(.easeInOut(duration: animationDuration)) {
                isPressed = true
                isLiked.toggle()
            }
            action()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (isLiked ? 0.6 : 0.45)) {
                withAnimation(.spring()) {
                    isPressed = false
                }
            }
        }) {
            Image(systemName: isLiked ? "suit.heart.fill" : "suit.heart")
                .foregroundColor(isLiked ? .red : .purple)
                .font(.system(size: 24))
                .scaleEffect(isPressed ? 1.3 : 1.0)
                .shadow(color: (isLiked ? Color.red : Color.purple).opacity(isPressed ? 0.7 : 0), radius: isPressed ? 10 : 0, x: 0, y: 0)
        }
        .animation(.spring(), value: isPressed)
    }
}

#Preview {
    LikeButton(isLiked: .constant(true)) {}
}

#Preview {
    LikeButton(isLiked: .constant(false)) {}
}
