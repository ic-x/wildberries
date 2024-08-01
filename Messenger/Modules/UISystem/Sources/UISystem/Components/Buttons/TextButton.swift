//
//  TextButton.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct TextButton<Label: View>: View {
    public var action: () -> Void
    public var label: () -> Label
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    public init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.action = action
        self.label = label
    }
    
    public var body: some View {
        Button(action: action) {
            label()
                .font(.subheading2)
                .foregroundStyle(isEnabled ? Color.textButton : .disclaimer)
                .lineSpacing(28)
                .multilineTextAlignment(.center)
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    TextButton(action: {}) {
        Text("Text Button")
    }
}
