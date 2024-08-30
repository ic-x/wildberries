//
//  PrimaryButton.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct CustomTextField<Label>: View where Label: View {
    @Binding var text: String
    let placeholder: String
    let label: Label

    public init(text: Binding<String>, placeholder: String = "", @ViewBuilder label: () -> Label) {
        self._text = text
        self.placeholder = placeholder
        self.label = label()
    }

    public var body: some View {
        HStack {
            label
            TextField(placeholder, text: $text)
                .font(.body1)
                .frame(height: 36)
                .padding(.horizontal, 8)
                .background(Color.inputField)
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.inputField.opacity(0.5), lineWidth: 1)
                )
        }
    }
}

#Preview {
    CustomTextField(text: .constant(""), placeholder: "Enter text") {
        Text("Label")
    }
    .padding()
}
