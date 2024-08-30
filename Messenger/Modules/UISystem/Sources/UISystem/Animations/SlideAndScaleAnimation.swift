//
//  SlideAndScaleAnimation.swift
//

import SwiftUI

public enum SlideDirection {
    case left, right, up, down
}

public struct SlideAndScaleAnimation: ViewModifier {
    public var offset: CGFloat
    public var direction: SlideDirection
    
    public init(offset: CGFloat = 300, direction: SlideDirection = .down) {
        self.offset = offset
        self.direction = direction
    }
    
    @State private var isVisible = false
    
    public func body(content: Content) -> some View {
        content
            .scaleEffect(isVisible ? 1 : 0.5)
            .offset(x: isVisible ? 0 : xOffset, y: isVisible ? 0 : yOffset)
            .opacity(isVisible ? 1 : 0)
            .animation(.easeInOut(duration: 0.5), value: isVisible)
            .onAppear {
                isVisible = true
            }
    }
    
    private var xOffset: CGFloat {
        switch direction {
        case .left:
            return -offset
        case .right:
            return offset
        default:
            return 0
        }
    }
    
    private var yOffset: CGFloat {
        switch direction {
        case .up:
            return -offset
        case .down:
            return offset
        default:
            return 0
        }
    }
}

extension View {
    public func slideAndScale(offset: CGFloat = 300, direction: SlideDirection = .down) -> some View {
        self.modifier(SlideAndScaleAnimation(offset: offset, direction: direction))
    }
}

#Preview {
    Text("Hello, World!")
        .slideAndScale()
}
