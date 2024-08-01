//
//  TermsOfUseView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct TermsOfUseView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = TermsOfUseViewModel()
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 20) {
                        Text("Условия использования")
                            .font(.Typography.Heading.h2)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .lineSpacing(3)
                            .padding(.bottom, 9)
                        
                        ForEach(viewModel.sections, id: \.title) { section in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(section.title)
                                    .font(.Typography.Subheading.sub1)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .lineSpacing(3)
                                    .padding(.bottom, 1)
                                
                                Text(section.content)
                                    .font(.Typography.Body.body2)
                                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                    .lineSpacing(3)
                                    .padding(.bottom, 6)
                            }
                        }
                    }
                    .foregroundStyle(.text)
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Закрыть")
                        .font(.Typography.Subheading.sub2)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.textButton)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.textButton)
                        )
                        .padding()
                }
            }
        }
    }
}

#Preview {
    TermsOfUseView()
}