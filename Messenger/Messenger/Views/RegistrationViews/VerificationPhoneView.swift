//
//  VerificationPhoneView.swift
//  Messenger
//
//  Created by Clark Adams on 6/12/24.
//

import SwiftUI

struct VerificationPhoneView: View {
    @Binding var navigationPath: NavigationPath
    @StateObject private var viewModel = VerificationPhoneViewModel()
    @State private var isAnimatingCircle = false
    @State private var loadingText: LocalizedStringKey = "loading"
    
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
            VStack {
                switch viewModel.isAnimating {
                case false:
                    Text("enter_phone_number")
                        .font(.Typography.Heading.h2)
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundStyle(.text)
                    
                    Text("confirmation_code_message")
                        .font(.Typography.Body.body2)
                        .lineSpacing(24)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                        .foregroundStyle(.text)
                default:
                    VStack {
                        Circle()
                            .stroke(LinearGradient(
                                gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ), lineWidth: 10)
                            .frame(width: 100, height: 100)
                            .shadow(color: .purple, radius: 10)
                            .rotationEffect(.degrees(isAnimatingCircle ? 360 : 0))
                            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: isAnimatingCircle)
                            .onAppear {
                                isAnimatingCircle = true
                            }
                            .padding(.bottom)
                        
                        ZStack (alignment: .leading) {
                            Text("loading_with_three_dots")
                                .opacity(0)
                            Text(loadingText)
                                .onAppear {
                                    startLoadingTextAnimation()
                                }
                        }
                        .padding(.top)
                    }
                    .transition(.scale)
                }
                
                HStack {
                    Button(action: {
                        viewModel.isPickerPresented.toggle()
                    }) {
                        HStack {
                            Image(viewModel.selectedCountry.flagImageName)
                                .resizable()
                                .frame(width: 18, height: 12)
                            Text(viewModel.selectedCountry.code)
                        }
                        .padding()
                    }
                    .sheet(isPresented: $viewModel.isPickerPresented) {
                        CountryPickerView(
                            selectedCountry: $viewModel.selectedCountry,
                            isPresented: $viewModel.isPickerPresented,
                            searchText: $viewModel.searchText,
                            viewModel: CountryPickerViewModel(countries: viewModel.filteredCountries)
                        )
                    }
                    
                    ZStack(alignment: .leading) {
                        Text("000 000-00-00")
                            .foregroundStyle(.brandPlaceholder)
                            .opacity(viewModel.phoneNumber.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.phoneNumber)
                            .keyboardType(.phonePad)
                            .onChange(of: viewModel.phoneNumber) { oldValue, newValue in
                                viewModel.phoneNumber = viewModel.formatPhoneNumber(String(newValue.filter { "0123456789".contains($0) }))
                            }
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.inputField)
                )
                .font(.Typography.Body.body1)
                .lineSpacing(24)
                .foregroundStyle(.text)
                .padding()
                .padding()
                .padding(.bottom)
                
                Button(action: {
                    withAnimation {
                        viewModel.isAnimating = true
                    }
                    
                    let formattedPhoneNumber = "\(viewModel.selectedCountry.code) \(viewModel.phoneNumber)"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        navigationPath.append(NavigationItem.verificationCodeView(phoneNumber: formattedPhoneNumber))
                    }
                }) {
                    Text("continue")
                        .font(.Typography.Subheading.sub2)
                        .lineSpacing(28)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.buttonText)
                        .background(viewModel.isPhoneNumberValid && !viewModel.isAnimating ? .button : .inactiveButton)
                        .cornerRadius(30)
                }
                .disabled(!(viewModel.isPhoneNumberValid && !viewModel.isAnimating))
                .padding(.horizontal, 40)
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        if !navigationPath.isEmpty {
                            navigationPath.removeLast()
                        }
                    }) {
                        Image("ChevronLeft")
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func startLoadingTextAnimation() {
        let loadingStates: [LocalizedStringKey] = [
            "loading",
            "loading_with_dot",
            "loading_with_two_dots",
            "loading_with_three_dots"
        ]
        var index = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            loadingText = loadingStates[index]
            index = (index + 1) % loadingStates.count
        }
    }
}

#Preview {
    VerificationPhoneView(navigationPath: .constant(NavigationPath()))
}
