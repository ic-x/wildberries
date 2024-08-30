//
//  FadeInAnimation.swift
//

import SwiftUI

public struct FadeInAnimation: ViewModifier {
    @State private var isVisible = false
    
    public func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1 : 0)
            .animation(.easeIn(duration: 0.5), value: isVisible)
            .onAppear {
                isVisible = true
            }
    }
}

extension View {
    public func fadeIn() -> some View {
        self.modifier(FadeInAnimation())
    }
}

#Preview {
    Text("Hello, World!")
        .fadeIn()
}
