//
//  DropInAnimation.swift
//

import SwiftUI

public struct DropInAnimation: ViewModifier {
    @State private var scale: CGFloat = 2.0
    @State private var offset: CGFloat = 100

    public func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .offset(y: offset)
            .animation(.easeOut(duration: 0.9), value: scale)
            .animation(.easeOut(duration: 0.9), value: offset)
            .onAppear {
                scale = 1.0
                offset = 0
            }
    }
}

extension View {
    public func dropIn() -> some View {
        self.modifier(DropInAnimation())
    }
}

#Preview {
    Text("Hello, World!")
        .dropIn()
}
