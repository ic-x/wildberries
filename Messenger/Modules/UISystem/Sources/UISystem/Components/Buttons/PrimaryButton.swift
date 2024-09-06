//
//  PrimaryButton.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct PrimaryButton<Label: View>: View {
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
                .foregroundStyle(Color.buttonText)
                .lineSpacing(28)
                .multilineTextAlignment(.center)
                .padding()
                .background(isEnabled ? Color.button : .inactiveButton)
                .cornerRadius(30)
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    PrimaryButton(action: {}) {
        Text("Primary Button")
    }
}
