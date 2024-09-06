//
//  SearchTextField.swift
//

import SwiftUI

@MainActor @preconcurrency
public struct SearchTextField: View {
    @Binding var text: String
    let placeholder: String
    
    public init(text: Binding<String>, placeholder: String = "Search") {
        self._text = text
        self.placeholder = placeholder
    }
    
    public var body: some View {
        HStack {
            Image(.searchIcon)
                .padding(.leading, 12)
            
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .font(.body1)
                .frame(height: 36)
                .padding(.trailing, 8)
                .padding(.leading, 4)
        }
        .background(Color.inputField)
        .cornerRadius(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.inputField.opacity(0.5), lineWidth: 1)
        )
    }
}

#Preview {
    SearchTextField(text: .constant(""))
        .padding()
}
